//---------//
// IMPORTS //
//---------//

local bundle = import 'lib/bundle.libsonnet';
local file_paths = import 'lib/file_paths.libsonnet';
local k = import 'lib/karabiner.libsonnet';

local unless_hypervisor_ide_remoteDesktop_terminalEmulator = k.condition(
  'unless',
  bundle.hypervisors + bundle.ides + bundle.remoteDesktops + bundle.terminalEmulators,
  file_paths.remoteDesktops,
);

local unless_hypervisor_remoteDesktop_terminalEmulator = k.condition(
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

local not_builtin_keyboard = {
  "type": "device_if",
  "identifiers": [
    { "is_built_in_keyboard": false }
  ]
};

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
  title: 'Windows Shortcuts',
  rules: [
    // Selecting/Copying/Cutting/Pasting {unless_hypervisor_remoteDesktop_terminalEmulator}
    k.rule('A (Ctrl) [Select All]',
           k.input('a', ['control']),
           k.outputKey('a', ['command']),
           unless_hypervisor_remoteDesktop_terminalEmulator),
    k.rule('C (Ctrl) [Copy]',
           k.input('c', ['left_control']),
           k.outputKey('c', ['command']),
           unless_hypervisor_remoteDesktop_terminalEmulator),
    k.rule('V (Ctrl) [Paste]',
           k.input('v', ['control']),
           k.outputKey('v', ['command']),
           unless_hypervisor_remoteDesktop_terminalEmulator),
    k.rule('X (Ctrl) [Cut]',
           k.input('x', ['control']),
           k.outputKey('x', ['command']),
           unless_hypervisor_remoteDesktop_terminalEmulator),
    // Undo/Redo/Find/Next (unless_hypervisor_remoteDesktop_terminalEmulator)
    k.rule('Z (Ctrl) [Undo/Redo]',
           k.input('z', ['control']),
           k.outputKey('z', ['command']),
           unless_hypervisor_remoteDesktop_terminalEmulator),
    k.rule('Y (Ctrl) [Redo]',
           k.input('y', ['control']),
           k.outputKey('y', ['command']),
           unless_hypervisor_remoteDesktop_terminalEmulator),
    k.rule('F (Ctrl) [Find]',
           k.input('f', ['control']),
           k.outputKey('f', ['command']),
           unless_hypervisor_remoteDesktop_terminalEmulator),
    k.rule('R (Ctrl) [Replace/Refresh]',
           k.input('r', ['control']),
           k.outputKey('r', ['command']),
           unless_hypervisor_remoteDesktop_terminalEmulator),

    // Everywhere rules
    // [WIN] Move the cursor backward to the beginning of the line.
    // [MAC] Move the insertion point to the beginning of the current line.
    // [MAC OVERRIDEN] Scroll to the beginning of a document. (The home key doesn't exist on apple keyboards, this behavior is still accessible using "Fn–Left Arrow")
    k.rule('Home',
           k.input('home'),
           k.outputKey('left_arrow', ['command']),),

    // [WIN] Move the cursor backward to the beginning of the document.
    // [MAC] Move the insertion point to the beginning of the document.
    k.rule('Home (Ctrl)',
           k.input('home', ['control']),
           k.outputKey('up_arrow', ['command']),),

    // [WIN] Select text from the current cursor position to the beginning of the current line.
    // [MAC] Select the text between the insertion point and the beginning of the current line.
    k.rule('Home (Shift)',
           k.input('home', ['shift']),
           k.outputKey('left_arrow', ['command', 'shift']),),

    // [WIN] Select text between the current cursor position and the beginning of the document.
    // [MAC] Select the text between the insertion point and the beginning of the document.
    k.rule('Home (Ctrl+Shift)',
           k.input('home', ['control', 'shift']),
           k.outputKey('up_arrow', ['command', 'shift'])),

    k.rule('End (Ctrl+Shift)',
           k.input('end', ['control', 'shift']),
           k.outputKey('down_arrow', ['command', 'shift']),),
    k.rule('End (Shift)',
           k.input('end', ['shift']),
           k.outputKey('right_arrow', ['command', 'shift']),),
    k.rule('End (Ctrl)',
           k.input('end', ['control']),
           k.outputKey('down_arrow', ['command']),),
    k.rule('End',
           k.input('end'),
           k.outputKey('right_arrow', ['command']),),

    k.rule('F1 [Help] {unless_hypervisor_ide_remoteDesktop_terminalEmulator}',
           k.input('f1'),
           k.outputKey('slash', ['command', 'shift']),
           [unless_hypervisor_ide_remoteDesktop_terminalEmulator, not_builtin_keyboard]),
    k.rule('F3 [Find Next] {unless_hypervisor_ide_remoteDesktop_terminalEmulator}',
           k.input('f3'),
           k.outputKey('g', ['command']),
           [unless_hypervisor_ide_remoteDesktop_terminalEmulator, not_builtin_keyboard]),

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
    k.rule('S (Ctrl) [Save]',
           k.input('s', ['control']),
           k.outputKey('s', ['command']),
           unless_hypervisor_ide_remoteDesktop_terminalEmulator),
    k.rule('T (Ctrl) [New Tab]',
           k.input('t', ['control']),
           k.outputKey('t', ['command']),
           unless_hypervisor_ide_remoteDesktop_terminalEmulator),
    k.rule('W (Ctrl) [Close Tab]',
           k.input('w', ['control']),
           k.outputKey('w', ['command']),
           unless_hypervisor_ide_remoteDesktop_terminalEmulator),


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
           [unless_hypervisor_ide_remoteDesktop, not_builtin_keyboard]),
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


// Disabled Rules

/* Formatting rules
    k.rule('B (Ctrl) [Bold]',
           k.input('b', ['control']),
           k.outputKey('b', ['command']),
           unless_hypervisor_ide_remoteDesktop_terminalEmulator),
    k.rule('I (Ctrl) [Italics]',
           k.input('i', ['control']),
           k.outputKey('i', ['command']),
           unless_hypervisor_ide_remoteDesktop_terminalEmulator),
    k.rule('U (Ctrl) [Underline]',
       k.input('u', ['control']),
       k.outputKey('u', ['command']),
       unless_hypervisor_ide_remoteDesktop_terminalEmulator),

    ////////////////////////////////////////////////////////////////////////////////////////////////
    k.rule('Win [Open Spotlight] [Always]',
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
           k.outputKey('power', ['control', 'shift'])),

    k.rule('Space (Ctrl) [Spotlight Search]',
           k.input('spacebar', ['control']),
           k.outputKey('spacebar', ['command']),
           unless_hypervisor_ide_remoteDesktop_terminalEmulator),
    k.rule('Insert (Ctrl) [Copy]',
           k.input('insert', ['control']),
           k.outputKey('c', ['command']),
           unless_hypervisor_ide_remoteDesktop_terminalEmulator),
    k.rule('Insert (Shift) [Copy]',
           k.input('insert', ['shift']),
           k.outputKey('v', ['command']),
           unless_hypervisor_ide_remoteDesktop_terminalEmulator),*/
  ],
}
