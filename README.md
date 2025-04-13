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
├── main/
│   └── bai9.v
|   └── doc
|        └── schematic.png
|        └── current_state.png
|   └── README.md


## 💡 How It Works

- The FSM has two main modes:
  - **LED animation mode**: Cycles through predefined LED patterns
  - **Message display mode**: Displays "HAPPY DAY" across all 7-segment displays
- The state machine advances every second, based on a clock divider from the 50MHz system clock.
- Reset switch (`SW[0]`) can bring the system back to the initial OFF state.

## 🧑‍💻 Author

**Le Minh Tri**  
📧 minhtri.lmt2004@gmail.com
🌐 [GitHub Profile](https://github.com/minhtrile2004)

## 📄 License

This project is licensed under the MIT License. See the `LICENSE` file for more details.

   
