# 🎛 LED State Machine + Message Display on DE2 Cyclone II

This is a Verilog-based project implemented on the DE2 Cyclone II FPGA development board. The system features a Finite State Machine (FSM) that cycles through multiple LED patterns and also displays a message ("HAPPY DAY") on the 7-segment displays under certain conditions.

## 🚀 Features

- FSM with 39 defined states (`s0` to `s38`)
- Dynamic LED pattern animation on red LEDs (`LEDR`)
- Displays "HAPPY DAY" on all 7-segment displays when active
- 3 clock domains:
  - 1-second clock for FSM state change
  - 200ms and 2s clocks available for other uses
- Modular state control via switches

## 🎛 Controls

| Switch      | Function                          |
|-------------|-----------------------------------|
| `SW[0]`     | Reset FSM to initial state        |

## 🖥 Output Mapping

- `LEDR[17:0]`: Red LED pattern based on FSM state
- `HEX[7:0]` : 7-segment display output
  - When in `ON` state, displays "HAPPY DAY"
  - Otherwise, displays blanks (`OFF`)

## 📂 File Structure

/fpga-de2-led-fsm/
│
├── src/
│   └── bai9.v
├
├── README.md
└── .gitignore
