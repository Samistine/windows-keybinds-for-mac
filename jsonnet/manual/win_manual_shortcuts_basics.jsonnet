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
  title: 'Windows Shortcuts (Basics)',
  rules: [
    // Selecting/Copying/Cutting/Pasting
    k.rule('A (Ctrl) [Select All]',
           k.input('a', ['control']),
           k.outputKey('a', ['command']),
           unless_hypervisor_ide_remoteDesktop_terminalEmulator),
    k.rule('C (Ctrl) [Copy]',
           k.input('c', ['left_control']),
           k.outputKey('c', ['command']),
           unless_hypervisor_ide_remoteDesktop_terminalEmulator),
    k.rule('V (Ctrl) [Paste]',
           k.input('v', ['control']),
           k.outputKey('v', ['command']),
           unless_hypervisor_ide_remoteDesktop_terminalEmulator),
    k.rule('X (Ctrl) [Cut]',
           k.input('x', ['control']),
           k.outputKey('x', ['command']),
           unless_hypervisor_ide_remoteDesktop_terminalEmulator),

    // Undo/Redo(with shift)
    k.rule('Z (Ctrl) [Undo/Redo]',
           k.input('z', ['control']),
           k.outputKey('z', ['command']),
           unless_hypervisor_ide_remoteDesktop_terminalEmulator),

    // Redo
    k.rule('Y (Ctrl) [Redo]',
           k.input('y', ['control']),
           k.outputKey('y', ['command']),
           unless_hypervisor_ide_remoteDesktop_terminalEmulator),
  ]
}