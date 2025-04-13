#FPGA LED và Hiển thị 7 đoạn (FSM)

> Thiết kế điều khiển LED và LED 7 đoạn sử dụng FSM (Finite State Machine) trên kit FPGA DE2 - Cyclone II.

## 🧠 Mô tả

- Khi bật công tắc `SW[0]`, hệ thống sẽ hiển thị dòng chữ "HAPPY DAY" trên các LED 7 đoạn (`HEX0` đến `HEX7`) theo trạng thái `ON`.
- Khi tắt công tắc `SW[0]`, hệ thống chuyển sang trạng thái `OFF`, tắt toàn bộ LED 7 đoạn.
- Một FSM điều khiển dãy sáng LED đỏ (`LEDR`) từ trái sang phải và ngược lại với nhịp 1s.

## ⚙️ Mạch & Clock

- Clock hệ thống: `CLOCK_50` (50 MHz).
- Bộ chia clock để tạo ra:
  - `1s`: điều khiển LED dãy.
  - `200ms`, `2s`: (có thể mở rộng).
- Có tổng cộng 39 trạng thái (`s0` đến `s38`) để tạo hiệu ứng LED đẹp mắt.

## 💡 Kiến thức sử dụng

- FSM (Finite State Machine)
- Bộ chia clock (Clock Divider)
- LED 7 đoạn
- Kỹ thuật ánh xạ LED trong Verilog

## 🖥️ Yêu cầu phần cứng

- Kit FPGA DE2 - Cyclone II
- Công tắc `SW[0]`, các LED `LEDR[17:0]`, `LEDG[7:0]`, LED 7 đoạn `HEX0` đến `HEX7`


