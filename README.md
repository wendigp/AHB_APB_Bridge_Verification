AHB to APB Bridge Verification
This project focuses on Design Verification (DV) of an AHB to APB bridge using UVM (Universal Verification Methodology). The bridge connects a high-performance AHB bus to a lower-speed APB bus, ensuring proper data transfer and protocol compliance.
________________________________________
🧰 Project Overview
•	Bus protocols: AMBA AHB and APB
•	Methodology: UVM-based environment
•	Verification goals: Functional correctness, protocol checks, coverage closure
•	Languages used: SystemVerilog (UVM), Verilog
________________________________________
🏗️ Directory Structure
ahb_apb_bridge_verification/
├── images/          # Contains waveform images and diagrams
├── rtl/
├── ahb_agt_top/
├── apb_agt_top/
├── tb/
├── test/
├── sim/
├── README.md
└── other project files
________________________________________
✅ Verification Features
•	UVM environment with reusable agents
•	Constrained random stimulus generation
•	Protocol checks via monitors and scoreboards
•	Self-checking tests
•	Functional coverage collection
________________________________________
💡 Key Achievements
•	Improved functional coverage from 84% to 96%
•	Added corner-case testcases
•	Fixed important bugs in both AHB and APB agents
•	Verified data integrity and control signals thoroughly
________________________________________
📈 Functional Coverage Report
Achieved 96% functional coverage, confirming thorough design verification.
✅ HTML Coverage Report (local view)
 
________________________________________
🛠️ Tools Used
•	Simulator: QuestaSim
•	Language: SystemVerilog + UVM
•	Version control: Git
________________________________________
✍️ Author
•	Name: Shiva Bind
•	LinkedIn: Shiva Bind
________________________________________
⭐ How to Run
1️⃣ Clone the repository:
git clone https://github.com/wendigp/AHB_APB_Bridge_Verification.git
cd AHB_APB_Bridge_Verification
2️⃣ Compile and run specific testcases using make targets (e.g., make test1, make test2, etc.):
make test1
✅ You can run other tests similarly: make test2, make test3, etc., depending on your defined test targets in the Makefile.
3️⃣ Generate coverage (if not already generated):
make cov
4️⃣ View coverage report:
make view_cov
________________________________________
🗂️ License
This project is for educational and demonstration purposes.

