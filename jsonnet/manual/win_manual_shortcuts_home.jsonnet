// NOTICE: It is preferred to set ~/Library/KeyBindings/DefaultKeyBinding.dict using the provided DefaultKeyBinding.dict

//---------//
// IMPORTS //
//---------//

local bundle = import 'lib/bundle.libsonnet';
local file_paths = import 'lib/file_paths.libsonnet';
local k = import 'lib/karabiner.libsonnet';

local unless_hypervisor_ide_remoteDesktop_terminalEmulator = k.condition(
  'unless',
  bundle.hypervisors + bundle.ides + bundle.remoteDesktops + bundle.terminalEmulators,
  file_paths.remoteDesktops
);

local unless_hypervisor_ide_remoteDesktop = k.condition(
  'unless',
  bundle.hypervisors + bundle.ides + bundle.remoteDesktops,
  file_paths.remoteDesktops
);

local unless_remoteDesktop_hypervisor = k.condition(
  'unless',
  bundle.hypervisors + bundle.remoteDesktops,
  file_paths.remoteDesktops
);

//------//
// MAIN //
//------//

// Title Comments:
// [SAFE-0] These rules do not overide any shortcuts.
// [SAFE-1] These rules do not overide any shortcuts included in MAC.
// [SAFE-3] If any behavior is overiden, it is not required behavior for any expected use case.

// Rule Comments:
// [WIN] = Windows description of task
// [MAC] = Mac description of task (for new output)
// [MAC OVERRIDEN] Mac description of original task that is no longer in affect

{
  title: 'Windows Shortcuts (Home/End Button) [SAFE]',
  rules: [
    // [WIN] Move the cursor backward to the beginning of the line.
    // [MAC] Move the insertion point to the beginning of the current line.
    // [MAC OVERRIDEN] Scroll to the beginning of a document. (The home key doesn't exist on apple keyboards, this behavior is still accessible using "Fn–Left Arrow")
    k.rule('Home',
           k.input('home'),
           k.outputKey('left_arrow', ['command']),
           unless_hypervisor_ide_remoteDesktop_terminalEmulator),

    // [WIN] Move the cursor backward to the beginning of the document.
    // [MAC] Move the insertion point to the beginning of the document.
    k.rule('Home (Ctrl)',
           k.input('home', ['control']),
           k.outputKey('up_arrow', ['command']),
           unless_hypervisor_ide_remoteDesktop_terminalEmulator),

    // [WIN] Select text from the current cursor position to the beginning of the current line.
    // [MAC] Select the text between the insertion point and the beginning of the current line.
    k.rule('Home (Shift)',
           k.input('home', ['shift']),
           k.outputKey('left_arrow', ['command', 'shift']),
           unless_hypervisor_ide_remoteDesktop_terminalEmulator),

    // [WIN] Select text between the current cursor position and the beginning of the document.
    // [MAC] Select the text between the insertion point and the beginning of the document.
    k.rule('Home (Ctrl+Shift)',
           k.input('home', ['control', 'shift']),
           k.outputKey('up_arrow', ['command', 'shift']),
           unless_hypervisor_ide_remoteDesktop_terminalEmulator),

    k.rule('End (Ctrl+Shift)',
           k.input('end', ['control', 'shift']),
           k.outputKey('down_arrow', ['command', 'shift']),
           unless_hypervisor_ide_remoteDesktop_terminalEmulator),
    k.rule('End (Shift)',
           k.input('end', ['shift']),
           k.outputKey('right_arrow', ['command', 'shift']),
           unless_hypervisor_ide_remoteDesktop_terminalEmulator),
    k.rule('End (Ctrl)',
           k.input('end', ['control']),
           k.outputKey('down_arrow', ['command']),
           unless_hypervisor_ide_remoteDesktop_terminalEmulator),
    k.rule('End',
           k.input('end'),
           k.outputKey('right_arrow', ['command']),
           unless_hypervisor_ide_remoteDesktop_terminalEmulator),
  ]
}