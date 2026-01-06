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
  title: 'Windows Shortcuts (Basic Copying/Cutting/Pasting)',
  rules: [
    /*k.rule('Insert (Ctrl) [Copy]',
           k.input('insert', ['control']),
           k.outputKey('c', ['command']),
           unless_hypervisor_ide_remoteDesktop_terminalEmulator),
    k.rule('Insert (Shift) [Copy]',
           k.input('insert', ['shift']),
           k.outputKey('v', ['command']),
           unless_hypervisor_ide_remoteDesktop_terminalEmulator),*/

    // Moved Home and End keys to DefaultKeyBinding.dict

    k.rule('Left Arrow (Ctrl)',
           k.input('left_arrow', ['control']),
           k.outputKey('left_arrow', ['option']),
           unless_hypervisor_ide_remoteDesktop_terminalEmulator),
    k.rule('Left Arrow (Ctrl+Shift)',
           k.input('left_arrow', ['control', 'shift']),
           k.outputKey('left_arrow', ['option', 'shift']),
           unless_hypervisor_ide_remoteDesktop_terminalEmulator),
    k.rule('Right Arrow (Ctrl)',
           k.input('right_arrow', ['control']),
           k.outputKey('right_arrow', ['option']),
           unless_hypervisor_ide_remoteDesktop_terminalEmulator),
    k.rule('Right Arrow (Ctrl+Shift)',
           k.input('right_arrow', ['control', 'shift']),
           k.outputKey('right_arrow', ['option', 'shift']),
           unless_hypervisor_ide_remoteDesktop_terminalEmulator),

    k.rule('Backspace (Ctrl)',
           k.input('delete_or_backspace', ['control']),
           k.outputKey('delete_or_backspace', ['option']),
           unless_hypervisor_ide_remoteDesktop_terminalEmulator),
    k.rule('Delete (Ctrl)',
           k.input('delete_forward', ['control']),
           k.outputKey('delete_forward', ['option']),
           unless_hypervisor_ide_remoteDesktop_terminalEmulator),

    // Not sure what this is for, excel should work fine with ctrl+shift+enter
    /*k.rule('Enter (Ctrl)',
           k.input('return_or_enter', ['control']),
           k.outputKey('return_or_enter', ['command']),
           unless_hypervisor_ide_remoteDesktop_terminalEmulator),
    k.rule('Enter (Ctrl+Shift)',
           k.input('return_or_enter', ['control', 'shift']),
           k.outputKey('return_or_enter', ['command', 'shift']),
           unless_hypervisor_ide_remoteDesktop_terminalEmulator),*/

    // Moved Ctrl-A to DefaultKeyBinding.dict

    /*k.rule('B (Ctrl) [Bold]',
           k.input('b', ['control']),
           k.outputKey('b', ['command']),
           unless_hypervisor_ide_remoteDesktop_terminalEmulator),*/

    // Moved Ctrl-C to DefaultKeyBinding.dict

    k.rule('F (Ctrl) [Find]',
           k.input('f', ['control']),
           k.outputKey('f', ['command']),
           unless_hypervisor_ide_remoteDesktop_terminalEmulator),
           
    /*k.rule('I (Ctrl) [Italics]',
           k.input('i', ['control']),
           k.outputKey('i', ['command']),
           unless_hypervisor_ide_remoteDesktop_terminalEmulator),*/
    k.rule('N (Ctrl) [New Item]',
           k.input('n', ['control']),
           k.outputKey('n', ['command']),
           unless_hypervisor_ide_remoteDesktop_terminalEmulator),
    k.rule('O (Ctrl) [Open]',
           k.input('o', ['control']),
           k.outputKey('o', ['command']),
           unless_hypervisor_ide_remoteDesktop_terminalEmulator),
    k.rule('P (Ctrl) [Print]',
           k.input('p', ['control']),
           k.outputKey('p', ['command']),
           unless_hypervisor_ide_remoteDesktop_terminalEmulator),
    k.rule('R (Ctrl) [Refresh]',
           k.input('r', ['control']),
           k.outputKey('r', ['command']),
           unless_hypervisor_ide_remoteDesktop_terminalEmulator),
    k.rule('S (Ctrl) [Save]',
           k.input('s', ['control']),
           k.outputKey('s', ['command']),
           unless_hypervisor_ide_remoteDesktop_terminalEmulator),
    k.rule('T (Ctrl) [New Tab]',
           k.input('t', ['control']),
           k.outputKey('t', ['command']),
           unless_hypervisor_ide_remoteDesktop_terminalEmulator),
    k.rule('U (Ctrl) [Underline]',
           k.input('u', ['control']),
           k.outputKey('u', ['command']),
           unless_hypervisor_ide_remoteDesktop_terminalEmulator),
    // Moved Ctrl-V to DefaultKeyBinding.dict
    k.rule('W (Ctrl) [Close Tab]',
           k.input('w', ['control']),
           k.outputKey('w', ['command']),
           unless_hypervisor_ide_remoteDesktop_terminalEmulator),
    // Moved Ctrl-X to DefaultKeyBinding.dict
    // Moved Ctrl-Y to DefaultKeyBinding.dict
    // Moved Ctrl-Z to DefaultKeyBinding.dict

    /*k.rule('Space (Ctrl) [Spotlight Search]',
           k.input('spacebar', ['control']),
           k.outputKey('spacebar', ['command']),
           unless_hypervisor_ide_remoteDesktop_terminalEmulator),*/
    k.rule('F1 [Help]',
           k.input('f1'),
           k.outputKey('slash', ['command', 'shift']),
           unless_hypervisor_ide_remoteDesktop_terminalEmulator),
    k.rule('F3 [Find Next]',
           k.input('f3'),
           k.outputKey('g', ['command']),
           unless_hypervisor_ide_remoteDesktop_terminalEmulator),

     ////////////////////////////////////////////////////////////////////////////////////////////////
    /*k.rule('Win [Open Spotlight] [Always]',
           k.input('left_command', key_is_modifier=true),
           [
             k.outputKey('left_command', output_type='to'),
             k.outputKey('spotlight', output_type='to_if_alone', key_code='apple_vendor_keyboard_key_code'),
           ]),
    k.rule('L (Win) [Lock Screen] [Always]',
           k.input('l', ['command']),
           k.outputKey('q', ['control', 'command'])),
    k.rule('L (Win) [Sleep] [Always]',
           k.input('l', ['command']),
           k.outputKey('power', ['control', 'shift'])),
    k.rule('L (Alt+Ctrl) [Lock Screen] [Always]',
           k.input('l', ['control', 'option']),
           k.outputKey('q', ['control', 'command'])),
    k.rule('L (Alt+Ctrl) [Sleep] [Always]',
           k.input('l', ['control', 'option']),
           k.outputKey('power', ['control', 'shift'])),*/
    ////////////////////////////////////////////////////////////////////////////////////////////////
    k.rule('Insert (Ctrl) [+Terminal Emulators]',
           k.input('insert', ['control']),
           k.outputKey('c', ['command']),
           unless_hypervisor_ide_remoteDesktop),
    k.rule('Insert (Shift) [+Terminal Emulators]',
           k.input('insert', ['shift']),
           k.outputKey('v', ['command']),
           unless_hypervisor_ide_remoteDesktop),
    k.rule('/ (Ctrl) [+Terminal Emulators]',
           k.input('slash', ['control']),
           k.outputKey('slash', ['command']),
           unless_hypervisor_ide_remoteDesktop),
    k.rule('F4 (Alt) [+Terminal Emulators]',
           k.input('f4', ['option']),
           k.outputKey('q', ['command']),
           unless_hypervisor_ide_remoteDesktop),
    ////////////////////////////////////////////////////////////////////////////////////////////////
    k.rule('C (Ctrl+Shift) [Only Terminal Emulators]',
           k.input('c', ['control', 'shift']),
           k.outputKey('c', ['command']),
           k.condition('if', bundle.terminalEmulators)),
    k.rule('V (Ctrl+Shift) [Only Terminal Emulators]',
           k.input('v', ['control', 'shift']),
           k.outputKey('v', ['command']),
           k.condition('if', bundle.terminalEmulators)),
    ////////////////////////////////////////////////////////////////////////////////////////////////
    k.rule('H (Ctrl) [Only Web Browsers]',
           k.input('h', ['control']),
           k.outputKey('y', ['command']),
           k.condition('if', bundle.webBrowsers)),
    k.rule('L (Ctrl) [Only Web Browsers]',
           k.input('l', ['control']),
           k.outputKey('l', ['command']),
           k.condition('if', bundle.webBrowsers)),
    ////////////////////////////////////////////////////////////////////////////////////////////////
    k.rule('F4 (Ctrl) [Only Chrome]',
           k.input('f4', ['control']),
           k.outputKey('w', ['command']),
           k.condition('if', ['^com\\.google\\.Chrome$', '^com\\.google\\.chrome$'])),
    k.rule('F5 [Only Chrome]',
           k.input('f5'),
           k.outputKey('r', ['command']),
           k.condition('if', ['^com\\.google\\.Chrome$', '^com\\.google\\.chrome$'])),
    ////////////////////////////////////////////////////////////////////////////////////////////////
    k.rule('Tab (Alt) [+IDEs, Remote Desktops, and Terminal Emulators]',
           k.input('tab', ['option']),
           k.outputKey('tab', ['command']),
           k.condition('unless', bundle.hypervisors + bundle.remoteDesktops, file_paths.remoteDesktops)),


    // IDE rules
    // Selecting/Copying/Cutting/Pasting
    k.rule('A (Ctrl) [Select All]',
           k.input('a', ['control']),
           k.outputKey('a', ['command']),
           bundle.ides),
    k.rule('C (Ctrl) [Copy]',
           k.input('c', ['left_control']),
           k.outputKey('c', ['command']),
           bundle.ides),
    k.rule('V (Ctrl) [Paste]',
           k.input('v', ['control']),
           k.outputKey('v', ['command']),
           bundle.ides),
    k.rule('X (Ctrl) [Cut]',
           k.input('x', ['control']),
           k.outputKey('x', ['command']),
           bundle.ides),

    // Undo/Redo(with shift)
    k.rule('Z (Ctrl) [Undo/Redo]',
           k.input('z', ['control']),
           k.outputKey('z', ['command']),
           bundle.ides),

    // Redo
    k.rule('Y (Ctrl) [Redo]',
           k.input('y', ['control']),
           k.outputKey('y', ['command']),
           bundle.ides),

    // Find
    k.rule('F (Ctrl)',
           k.input('f', ['control']),
           k.outputKey('f', ['command']),
           bundle.ides),

    // Everywhere rules
    k.rule('Home',
           k.input('home'),
           k.outputKey('left_arrow', ['command']),),
    k.rule('End',
           k.input('end'),
           k.outputKey('right_arrow', ['command']),),
  ],
}
