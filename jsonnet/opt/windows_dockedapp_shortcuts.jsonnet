//---------//
// IMPORTS //
//---------//

local bundle = import 'lib/bundle.libsonnet';
local file_paths = import 'lib/file_paths.libsonnet';
local k = import 'lib/karabiner.libsonnet';

local unless_remoteDesktop_hypervisor = k.condition(
  'unless',
  bundle.hypervisors + bundle.remoteDesktops,
  file_paths.remoteDesktops
);

//------//
// MAIN //
//------//

{
    k.rule('1 (Cmd) [Open first pinned Dock app (Finder); +IDEs and Terminal Emulators]',
           k.input('1', ['command']),
           k.outputShell('open -b com.apple.finder'),
           unless_remoteDesktop_hypervisor),
    k.rule('2 (Cmd) [Open second pinned Dock app; +IDEs and Terminal Emulators]',
           k.input('2', ['command']),
           k.runDockedApp('0'),
           unless_remoteDesktop_hypervisor),
    k.rule('3 (Cmd) [Open third pinned Dock app; +IDEs and Terminal Emulators]',
           k.input('3', ['command']),
           k.runDockedApp('1'),
           unless_remoteDesktop_hypervisor),
    k.rule('4 (Cmd) [Open fourth pinned Dock app; +IDEs and Terminal Emulators]',
           k.input('4', ['command']),
           k.runDockedApp('2'),
           unless_remoteDesktop_hypervisor),
    k.rule('5 (Cmd) [Open fifth pinned Dock app; +IDEs and Terminal Emulators]',
           k.input('5', ['command']),
           k.runDockedApp('3'),
           unless_remoteDesktop_hypervisor),
    k.rule('6 (Cmd) [Open sixth pinned Dock app; +IDEs and Terminal Emulators]',
           k.input('6', ['command']),
           k.runDockedApp('4'),
           unless_remoteDesktop_hypervisor),
    k.rule('7 (Cmd) [Open seventh pinned Dock app; +IDEs and Terminal Emulators]',
           k.input('7', ['command']),
           k.runDockedApp('5'),
           unless_remoteDesktop_hypervisor),
    k.rule('8 (Cmd) [Open eighth pinned Dock app; +IDEs and Terminal Emulators]',
           k.input('8', ['command']),
           k.runDockedApp('6'),
           unless_remoteDesktop_hypervisor),
    k.rule('9 (Cmd) [Open ninth pinned Dock app; +IDEs and Terminal Emulators]',
           k.input('9', ['command']),
           k.runDockedApp('7'),
           unless_remoteDesktop_hypervisor),
}