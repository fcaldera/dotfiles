function keyremap -d 'Run my custom key mappings'
  switch $argv[1]
    case 'off'
      hidutil property --set '{"UserKeyMapping":[]}'
    case "full"
      sudo hidutil property --set '{"UserKeyMapping":[
        {
          "HIDKeyboardModifierMappingSrc": 0x700000064,
          "HIDKeyboardModifierMappingDst": 0x700000035
        },
        {
          "HIDKeyboardModifierMappingSrc": 0x700000035,
          "HIDKeyboardModifierMappingDst": 0x700000031
        },
        {
          "HIDKeyboardModifierMappingSrc": 0x700000031,
          "HIDKeyboardModifierMappingDst": 0x700000028
        },
        { 
          "HIDKeyboardModifierMappingSrc": 0x7000000E7, 
          "HIDKeyboardModifierMappingDst": 0x7000000E6 
        }
      ]}'
    case '*'
      hidutil property --set '{"UserKeyMapping":[
        { 
          "HIDKeyboardModifierMappingSrc": 0x7000000E7, 
          "HIDKeyboardModifierMappingDst": 0x7000000E6 
        }
      ]}'
  end
end
