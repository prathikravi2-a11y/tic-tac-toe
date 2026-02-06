# 🎮 Tic-Tac-Toe Game in Verilog HDL

> A complete **hardware-based Tic-Tac-Toe game engine** implemented using **Verilog HDL**, designed for simulation, synthesis, and real FPGA deployment.

---

## ✨ Project Overview
This project implements a **fully functional 2-player Tic-Tac-Toe game** in Verilog. It models real digital hardware concepts such as:
- Clocked sequential logic  
- Combinational win-detection logic  
- Register-based memory (game board)  
- Player state management  

The design is suitable for:
- 🧪 Simulation (ModelSim / Icarus / GTKWave)  
- 🧠 RTL learning & digital design practice  
- 🔧 FPGA implementation  
- 📚 Academic projects & labs  

---

## 🧩 Features

✔ Two-player game logic (X vs O)  
✔ Turn-based control using clock  
✔ Win detection (rows, columns, diagonals)  
✔ Game-over detection  
✔ Reset functionality  
✔ Synthesizable RTL design  
✔ Modular architecture  
✔ Real-hardware ready design  
✔ Clean testbench for simulation  

---

## 🏗️ Architecture

[ User Inputs ]
│
▼
[cell_select , place]
│
▼
┌──────────────────────────┐
│ tic_tac_toe.v │
│ (Game Control Logic) │
│ │
│ - Board Registers │
│ - Player Control │
│ - Win Detection │
│ - Game State Logic │
└──────────────────────────┘
│
▼
[ Outputs: winner, game_over, current_player ]


---

## 🧠 Game Logic Representation

| Cell Value | Meaning |
|------|--------|
| `00` | Empty |
| `01` | Player X |
| `10` | Player O |

---
## 🧪 Simulation

### ▶ Using Icarus Verilog
```bash
iverilog -o game tb_tic_tac_toe.v tic_tac_toe.v
vvp game
gtkwave dump.vcd

