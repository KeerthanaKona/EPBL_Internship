# EPBL Internship 2026

## Project Title

**Design and FPGA Implementation of a Starvation-Free Adaptive Priority Traffic Controller for Dynamic Intersection Management**

---

## Team Members

| S.No | Name | Roll Number |
|:---:|-------------------------------|:-----------:|
| 1 | Ganja Datta Sai Naga Venkata Vinay | 23881A0488 |
| 2 | Gollapelly Akshaya | 23881A0489 |
| 3 | Kona Keerthana | 23881A0494 |

---

## Supervisor

**Dr. Ch. Sreenivasa Rao**  
Professor, Department of Electronics and Communication Engineering

---

## Project Domain

**VLSI Design and Systems**

---

## Repository File Description

| File Name | Description |
|-----------|-------------|
| `traffic_controller.v` | Main Verilog HDL source code implementing the starvation-free adaptive priority traffic controller. |
| `traffic_controller_tb.v` | Testbench used for functional simulation and verification of the controller. |
| `Report_EPBL.pdf` | Complete internship project report including methodology, design, implementation, and results. |
| `Images_Result.pdf` | Simulation waveforms, RTL schematics, and implementation screenshots. |
| `README.md` | Project documentation and repository overview. |

---

## Project Description

This project presents the design and FPGA implementation of a **Starvation-Free Adaptive Priority Traffic Controller** for dynamic intersection management using **Verilog HDL**.

Unlike conventional traffic signal controllers with fixed timing, this system dynamically adjusts signal durations based on traffic density while ensuring that no direction experiences indefinite waiting (starvation). The controller also supports emergency vehicle priority, enabling faster clearance during critical situations.

The complete design was developed using Verilog HDL, verified through simulation, and implemented using FPGA design tools.

---

## Key Features

- Adaptive traffic signal timing
- Starvation-free scheduling algorithm
- Emergency vehicle priority handling
- Finite State Machine (FSM) based controller
- Verilog HDL implementation
- Functional simulation and verification
- FPGA implementation compatible
- Modular and scalable architecture

---

## Tools & Technologies

- Verilog HDL
- Xilinx Vivado
- ModelSim / Vivado Simulator
- FPGA Development Flow
- Digital Logic Design
- Finite State Machine (FSM)

---

## How to Run / Simulate

1. Clone this repository.
2. Open **Xilinx Vivado**.
3. Create a new RTL project.
4. Add `traffic_controller.v`.
5. Add `traffic_controller_tb.v`.
6. Set the testbench as the top module.
7. Run **Behavioral Simulation**.
8. Observe the generated waveforms.
9. (Optional) Synthesize and implement the design for FPGA deployment.

---

## Repository Contents

```
EPBL_Internship/
│
├── traffic_controller.v
├── traffic_controller_tb.v
├── Report_EPBL.pdf
├── Images_Result.pdf
└── README.md
```

---

## Submission Details

**Program:** EPBL Internship 2026

**Project Domain:** VLSI Design and Systems

---

## License

This repository has been created for academic and educational purposes as part of the EPBL Internship project.
