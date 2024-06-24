function keyremap -d 'Run my custom key mappings'

  if [ "$argv[1]" = 'off' ]
    hidutil property --set '{"UserKeyMapping":[]}'
  else
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
      }
    ]}'
  end
end
