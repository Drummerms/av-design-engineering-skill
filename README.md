# AV Design Engineering Skill

Expert AV design engineer for Higher Education distance learning environments. Generates complete AV system designs with BOM, SOW, signal flow diagrams, and rack elevations.

## Features

- **Complete AV System Designs**: Generates Bill of Materials (BOM), Statement of Work (SOW), Signal Flow Diagrams, and Rack Elevations
- **HyFlex Architecture**: Native support for hybrid-flexible classrooms with Zoom/Teams integration
- **Signal Validation**: Validates Audio/Video/Control/Power signal compatibility
- **Standards Compliance**: Enforces AVIXA/CTS-D/CTS-I standards
- **Approved Manufacturers**: Sources from QSC, Crestron, Extron, Shure, Sennheiser, Biamp, Dante, LG, Panasonic, Netgear, Middle Atlantic, Chief

## Quick Start

### Installation

**Claude Code (User-level):**
```bash
git clone https://github.com/YOUR-USERNAME/av-design-engineering-skill.git ~/.claude/skills/av-design-engineering-skill
```

**Claude Code (Project-level):**
```bash
git clone https://github.com/YOUR-USERNAME/av-design-engineering-skill.git .claude/skills/av-design-engineering-skill
```

**Cursor:**
```bash
git clone https://github.com/YOUR-USERNAME/av-design-engineering-skill.git .cursor/rules/av-design-engineering-skill
```

**GitHub Copilot:**
```bash
git clone https://github.com/YOUR-USERNAME/av-design-engineering-skill.git .github/skills/av-design-engineering-skill
```

**Windsurf:**
```bash
git clone https://github.com/YOUR-USERNAME/av-design-engineering-skill.git .windsurf/skills/av-design-engineering-skill
```

**Using the install script:**
```bash
./install.sh                    # Auto-detect platform
./install.sh --platform cursor  # Install for specific platform
./install.sh --dry-run          # Preview installation
```

### Usage

After installation, invoke the skill in your AI assistant:

```
/av-design-engineering-skill Design a lecture hall for 150 seats with HyFlex
```

```
/av-design-engineering-skill Create an AV system for a 40-seat classroom with Zoom Rooms
```

## Target Environments

- College classrooms
- Lecture halls
- Auditoriums

## Deliverables

Every design request produces four deliverables:

### 1. Bill of Materials (BOM)

Markdown table grouped by functional categories:
- Processing & Control
- Audio
- Video
- Infrastructure & Rack

Includes: Manufacturer, Model, Description, Qty, I/O & Compatibility Resolution

### 2. Statement of Work (SOW)

Structured document with sections:
1. Project Scope
2. Physical Installation & Infrastructure
3. Signal Flow Resolution & Programming
4. Commissioning & Handover

### 3. Signal Flow Diagram

Mermaid flowchart format showing:
- Audio Signal Path
- Video Signal Path
- Control Signal Path
- Power Distribution

### 4. Rack Elevation

Text-based rack layout showing:
- RU position for each device
- Total RU / Used / Available
- Thermal notes
- Cable management notes

## Interaction Modes

| Command | Behavior |
|---------|----------|
| **Initial request** | Creates new design context |
| **Iterate request** | Modifies current design, preserves context |
| **"New design" / "Reset"** | Clears context, prompts for fresh parameters |

### Example Iteration

```
User: /av-design-engineering-skill Design a lecture hall for 120 seats with HyFlex
[Skill generates complete design]

User: Swap the displays for a single laser projector
[Skill updates BOM, SOW, signal flow, and rack elevation]

User: Add wireless microphone support for 4 channels
[Skill adds wireless to the design, updates all deliverables]
```

## Signal Validation

The skill validates all signal connections for:

- **Audio**: Mic Level, Consumer Line, Professional Line, Dante, AVB
- **Video**: HDMI, HDBaseT, DisplayPort, SDI, VGA
- **Control**: RS-232, TCP/IP, PoE, Relay, GPIO, IR, CEC
- **Power**: AC Mains, PoE (af/at/bt), Phantom Power, DC Power

## Standards Checkpoints

### CTS-D (Design)
- Sight lines and viewing distance
- Sound coverage and NC targets
- Microphone pickup patterns
- Cable pathway capacity

### CTS-I (Installation)
- Rack thermal management
- Grounding and bonding
- Labeling standards
- Service loop requirements

## Directory Structure

```
av-design-engineering-skill/
├── SKILL.md                         # Main skill file
├── assets/
│   ├── equipment-database.csv       # Core equipment templates
│   ├── signal-compatibility.csv     # Signal type definitions
│   └── standards-reference.csv      # AVIXA/CTS-D/CTS-I checkpoints
├── references/
│   ├── signal-validation.md         # Technical signal reference
│   ├── design-patterns.md           # HyFlex, distance learning patterns
│   ├── deliverable-formats.md       # Output templates
│   └── manufacturer-ecosystems.md   # Compatible product groupings
├── install.sh                       # Cross-platform installer
└── README.md                        # This file
```

## Approved Manufacturers

| Category | Manufacturers |
|----------|---------------|
| Processing & Control | QSC, Crestron, Extron, Biamp |
| Audio | Shure, Sennheiser, QSC, Biamp |
| Video | QSC, Crestron, LG, Panasonic |
| Infrastructure | Netgear, Middle Atlantic, Chief, SurgeX |
| Networking | Audinate/Dante, Netgear |

## Requirements

- Target user: AV Design Engineer (professional with existing AV knowledge)
- AI assistant with skill support (Claude Code, Cursor, GitHub Copilot, etc.)

## License

MIT

## Author

Michael Sablatura

## Version

1.0.0 (2026-02-28)
