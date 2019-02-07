# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2018-present Team LibreELEC (https://libreelec.tv)

from contextlib import closing
import json
import socket
import subprocess
import xbmc
import xbmcaddon


_addon = xbmcaddon.Addon()
_addon_id = _addon.getAddonInfo('id')
_settings_restart = ['ss_cp', 'ss_ni', 'ss_sp']
_settings_update = ['ss_mu', 'ss_pc', 'ss_st']


class Monitor(xbmc.Monitor):

    def __init__(self, *args, **kwargs):
        xbmc.Monitor.__init__(self)
        self.rpc_request = 0
        self.setSettings(self.getSettings())

    def getSettings(self):
        settings = {}
        for setting in _settings_restart + _settings_update:
            settings[setting] = _addon.getSetting(setting)
        return settings

    def onSettingsChanged(self):
        settings = self.getSettings()
        for setting in _settings_update:
            if settings[setting] != self.settings[setting]:
                muted = True if settings['ss_mu'] == 'true' else False
                percent = int(settings['ss_pc'])
                response = self.rpc('Server.GetStatus')
                for group in response['result']['server']['groups']:
                    self.rpc('Group.SetStream', {
                             'id': group['id'], 'stream_id': settings['ss_st']})
                    for client in group['clients']:
                        self.rpc('Client.SetVolume', {'id': client['id'], 'volume': {
                                 'muted': muted, 'percent': percent}})
                break
        for setting in _settings_restart:
            if settings[setting] != self.settings[setting]:
                subprocess.call(['systemctl', command, _addon_id])
                break
        self.setSettings(settings)

    def rpc(self, method, params={}):
        self.rpc_request += 1
        request = json.dumps({'id':
                              self.rpc_request,
                              'jsonrpc':
                                  '2.0',
                              'method':
                                  method,
                              'params':
                                  params,
                              })
        response = ''
        with closing(socket.socket(socket.AF_INET, socket.SOCK_STREAM)) as s:
            s.connect(('127.0.0.1', self.rpc_port))
            s.send(request + '\r\n')
            response = s.recv(10240)
        return json.loads(response)

    def setSettings(self, settings):
        self.settings = settings
        self.rpc_port = int(settings['ss_cp'])


if __name__ == '__main__':
    Monitor().waitForAbort()
