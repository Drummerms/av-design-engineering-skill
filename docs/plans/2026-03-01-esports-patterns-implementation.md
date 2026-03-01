# Esports Facility Design Patterns Implementation Plan

> **For Claude:** REQUIRED SUB-SKILL: Use superpowers:executing-plans to implement this plan task-by-task.

**Goal:** Add comprehensive Esports Facility design patterns to the AV Design Engineering skill for Higher Education varsity competitive gaming programs.

**Architecture:** Extend existing `references/design-patterns.md` with a new Esports Facility section following the same structure as HyFlex patterns. Update SKILL.md triggers and add esports equipment to the CSV database.

**Tech Stack:** Markdown, CSV, Mermaid diagrams

---

## Task 1: Add Esports Facility Architecture Section

**Files:**
- Modify: `references/design-patterns.md` (append after line 346)

**Step 1: Add section header and overview**

Append to `references/design-patterns.md`:

```markdown
## Esports Facility Architecture

Esports facilities in Higher Education support competitive gaming programs, combining professional broadcast production with gaming-optimized infrastructure. Unlike traditional AV spaces, esports requires ultra-low latency signal paths, dedicated gaming networks, and broadcast-quality production for streaming.

### Core Principles

1. **Low Latency:** All video/audio paths optimized for sub-frame delay (< 16ms)
2. **Broadcast Quality:** 1080p60 minimum, 4K capability for main displays
3. **Network Segregation:** Gaming traffic isolated from broadcast and management
4. **Platform Agnostic:** NDI/SDI infrastructure with encoding at final stage
5. **Scalability:** Patterns scale from 5-station studio to 40-station arena

### Facility Zones

| Zone | Function | Key Equipment |
|------|----------|---------------|
| Gaming Arena | Competitive play area | Gaming stations, player monitors, network switches |
| Broadcast Control | Production and streaming | Switcher, audio mixer, encoders, intercom |
| Spectator Area | Audience seating and viewing | Video wall, PA system, secondary displays |
| Shoutcaster Desk | Live commentary | Commentary positions, program monitors, talkback |

### Signal Flow Architecture

```
┌─────────────────────────────────────────────────────────────────────────────────┐
│                         ESPORTS FACILITY SIGNAL FLOW                             │
├─────────────────────────────────────────────────────────────────────────────────┤
│                                                                                 │
│  GAMING ARENA                           BROADCAST CONTROL                        │
│  ┌──────────────┐                      ┌─────────────────────────────────────┐  │
│  │   Gaming     │    NDI/SDI           │                                     │  │
│  │   Station 1  │─────────────────────▶│   Production Switcher               │  │
│  │   (PC+Game)  │                      │   (Blackmagic ATEM / vMix)          │  │
│  ├──────────────┤                      │                                     │  │
│  │   Gaming     │                      │   ┌─────────┐    ┌──────────────┐   │  │
│  │   Station 2  │──────────┐           │   │ Graphics│    │   Stream     │   │  │
│  ├──────────────┤          │           │   │   PC    │───▶│   Encoders   │───┼──▶ Twitch/YouTube
│  │     ...      │          │           │   └─────────┘    └──────────────┘   │  │
│  ├──────────────┤          │           │                                     │  │
│  │   Gaming     │          │           │   ┌─────────┐    ┌──────────────┐   │  │
│  │   Station N  │──────────┴──────────▶│   │  Audio  │    │   Recording  │   │  │
│  └──────────────┘    Video Capture     │   │  Mixer  │───▶│   (HyperDeck)│   │  │
│                                        │   └─────────┘    └──────────────┘   │  │
│  ┌──────────────┐                      │         ▲                          │  │
│  │   Shoutcaster│─────────────────────────────────┘                          │  │
│  │     Desk     │                      └─────────────────────────────────────┘  │
│  │   (2-4 pos)  │                                    │                          │
│  └──────────────┘                                    ▼                          │
│                                        ┌─────────────────────────────────────┐  │
│  SPECTATOR AREA                        │                                     │  │
│  ┌──────────────┐                      │   Main Video Wall                   │  │
│  │   Secondary  │◀─────────────────────│   (2x2 or 3x2 55" displays)         │  │
│  │   Displays   │                      │                                     │  │
│  └──────────────┘                      └─────────────────────────────────────┘  │
│                                                                                 │
│  NETWORK ARCHITECTURE (Three VLANs)                                            │
│  ┌─────────────────┐  ┌─────────────────┐  ┌─────────────────┐                │
│  │  Gaming VLAN    │  │ Broadcast VLAN  │  │ Management VLAN │                │
│  │  (10.x.x.x)     │  │  (172.x.x.x)    │  │  (192.x.x.x)    │                │
│  │  QoS Priority   │  │  NDI Optimized  │  │  Control/HTTP   │                │
│  └─────────────────┘  └─────────────────┘  └─────────────────┘                │
│                                                                                 │
└─────────────────────────────────────────────────────────────────────────────────┘
```
```

**Step 2: Verify markdown formatting**

Read the file to confirm the section was appended correctly.

**Step 3: Commit**

```bash
git add references/design-patterns.md
git commit -m "docs: add Esports Facility Architecture section header and signal flow"
```

---

## Task 2: Add Gaming Station Standards

**Files:**
- Modify: `references/design-patterns.md` (append after Task 1 content)

**Step 1: Add gaming station standards section**

Append to `references/design-patterns.md`:

```markdown

### Gaming Station Standards

Each competitive gaming station requires dedicated AV infrastructure for both player experience and broadcast capture.

#### Per-Station Requirements

| Component | Specification | Purpose |
|-----------|---------------|---------|
| Gaming PC | RTX 4070+, 32GB RAM, NVMe | Competitive gaming performance |
| Gaming Monitor | 24-27" 1080p 144Hz+ minimum | Low latency display |
| Headset | USB or 3.5mm with mic | Player communication and game audio |
| Keyboard/Mouse | Tournament-grade peripherals | Player input devices |
| Network | 1Gbps dedicated port, Gaming VLAN | Low-latency game traffic |
| Video Capture | NDI encoder or SDI output | Broadcast feed of gameplay |
| Facecam (optional) | USB webcam or PTZ | Player camera for broadcast |

#### Video Capture Options

| Method | Latency | Quality | Cost | Notes |
|--------|---------|---------|------|-------|
| NDI (software) | 2-5 frames | 1080p60 | Low | Requires CPU overhead on gaming PC |
| NDI (hardware) | 1-2 frames | 4K60 | Medium | Magewell EcoCapture, AVerMedia |
| SDI (capture card) | < 1 frame | 1080p60 | High | Blackmagic DeckLink, lowest latency |
| HDMI Direct | 0 frames | 4K60 | Low | No capture, display only |

**Recommended:** Hardware NDI encoder (Magewell EcoCapture) for balance of latency, quality, and cost.

#### Team Row Configuration

Standard esports team format is 5v5. Configure gaming stations in rows or pods:

```
┌─────────────────────────────────────────────────────────────────┐
│  TEAM A ROW (5 Stations)                                        │
│  ┌────┐ ┌────┐ ┌────┐ ┌────┐ ┌────┐     ┌────┐                │
│  │ P1 │ │ P2 │ │ P3 │ │ P4 │ │ P5 │     │Coach│                │
│  └────┘ └────┘ └────┘ └────┘ └────┘     └────┘                │
│    │      │      │      │      │          │                    │
│    └──────┴──────┴──────┴──────┴──────────┘                    │
│                     │                                           │
│              Local Switch (Gaming VLAN)                         │
│                     │                                           │
└─────────────────────┼───────────────────────────────────────────┘
                      │
              Core Switch → Gaming Network
```

**Row Infrastructure:**
- Local 8-port switch per row (reduces cable runs)
- Cable management trough or under-desk routing
- Dedicated circuit per 10 stations (15A per circuit)
- Coach position at row end with overview monitor
```

**Step 2: Commit**

```bash
git add references/design-patterns.md
git commit -m "docs: add Gaming Station Standards for esports facilities"
```

---

## Task 3: Add Broadcast/Streaming Production Section

**Files:**
- Modify: `references/design-patterns.md` (append after Task 2 content)

**Step 1: Add broadcast production section**

Append to `references/design-patterns.md`:

```markdown

### Broadcast/Streaming Production

Professional esports production requires broadcast-quality infrastructure with multi-destination streaming capability.

#### Production Switcher Hierarchy

| Tier | Equipment | Inputs | Outputs | Use Case |
|------|-----------|--------|---------|----------|
| Entry | OBS/vMix (software) | Unlimited NDI | Multi-stream | Small studio, budget |
| Mid | Blackmagic ATEM Mini Extreme ISO | 8 HDMI + 4 NDI | 4 + recording | Competition arena |
| Pro | Blackmagic ATEM Constellation 8K | 40 M/E | 24 + multi-view | Large arena, broadcast |
| Enterprise | Newtek TriCaster TC2 Elite | 32 NDI + 16 SDI | Unlimited | Multi-venue production |

**Recommended for Higher Education:** Blackmagic ATEM Constellation for competitive arena, vMix for smaller studios.

#### Shoutcaster/Commentary Positions

Standard commentary desk configuration:

```
┌─────────────────────────────────────────────────────────────────┐
│  SHOUTCASTER DESK (2-4 Positions)                               │
│                                                                 │
│  ┌─────────┐    ┌─────────┐    ┌─────────┐    ┌─────────┐      │
│  │  SC 1   │    │  SC 2   │    │  SC 3   │    │  SC 4   │      │
│  │ Monitor │    │ Monitor │    │ Monitor │    │ Monitor │      │
│  │ Headset │    │ Headset │    │ Headset │    │ Headset │      │
│  │   Mic   │    │   Mic   │    │   Mic   │    │   Mic   │      │
│  └─────────┘    └─────────┘    └─────────┘    └─────────┘      │
│       │              │              │              │            │
│       └──────────────┴──────────────┴──────────────┘            │
│                          │                                      │
│                   Audio Mixer                                   │
│                   (Behringer X32 or similar)                    │
│                          │                                      │
│              ┌───────────┴───────────┐                         │
│              ▼                       ▼                          │
│         Broadcast Mix           Intercom/Talkback              │
│         (to switcher)           (to control room)              │
│                                                                 │
│  Each position requires:                                        │
│  - Program monitor (game feed + graphics)                       │
│  - Preview monitor (next scene/camera)                          │
│  - Headset with mic (commentary audio)                          │
│  - Talkback button (communicate with control room)              │
│                                                                 │
└─────────────────────────────────────────────────────────────────┘
```

#### Multi-Destination Streaming Architecture

Platform-agnostic streaming uses NDI/SDI infrastructure with encoding at the final stage:

```
┌─────────────────────────────────────────────────────────────────┐
│  STREAMING ARCHITECTURE (Platform Agnostic)                     │
│                                                                 │
│  Production Switcher                                            │
│         │                                                       │
│         ▼                                                       │
│  ┌─────────────────┐                                            │
│  │   Master Out    │                                            │
│  │   (NDI/SDI)     │                                            │
│  └────────┬────────┘                                            │
│           │                                                     │
│           ├─────────────────┬─────────────────┬────────────┐   │
│           ▼                 ▼                 ▼            ▼   │
│  ┌────────────┐    ┌────────────┐    ┌────────────┐ ┌─────────┐│
│  │ Encoder 1  │    │ Encoder 2  │    │ Encoder 3  │ │Recording││
│  │ (Twitch)   │    │ (YouTube)  │    │ (Facebook) │ │(HyperDeck││
│  │ Teradek    │    │ Makito X   │    │ OBS/FFmpeg │ │ or SSD) ││
│  └────────────┘    └────────────┘    └────────────┘ └─────────┘│
│                                                                 │
│  Encoder Options:                                               │
│  - Hardware: Teradek Prism, Makito X, AWS Elemental             │
│  - Software: OBS, vMix, FFmpeg                                  │
│  - Cloud: AWS IVS, Mux, Vimeo Enterprise                        │
│                                                                 │
└─────────────────────────────────────────────────────────────────┘
```
```

**Step 2: Commit**

```bash
git add references/design-patterns.md
git commit -m "docs: add Broadcast/Streaming Production section for esports"
```

---

## Task 4: Add Spectator Experience Section

**Files:**
- Modify: `references/design-patterns.md` (append after Task 3 content)

**Step 1: Add spectator experience section**

Append to `references/design-patterns.md`:

```markdown

### Spectator Experience

Esports spectator areas require AV systems optimized for live audience engagement while maintaining broadcast-quality output.

#### Display Strategy

| Display Type | Size | Quantity | Content |
|--------------|------|----------|---------|
| Main Video Wall | 55" x 4 (2x2) or 55" x 6 (3x2) | 1 | Program feed with graphics |
| Game Feed Displays | 65-75" | 2-4 | Individual player POVs |
| Scoreboard | 32-43" | 1-2 | Scores, timers, brackets |
| Confidence Monitors | 24" | 2-4 | For shoutcasters and players |

**Video Wall Configuration:**

```
┌─────────────────────────────────────────────────────────────────┐
│  MAIN VIDEO WALL OPTIONS                                        │
│                                                                 │
│  Option A: 2x2 (110" diagonal)                                  │
│  ┌───────────────┬───────────────┐                             │
│  │               │               │                             │
│  │     55"       │     55"       │   Good for: 50-100 seats    │
│  │               │               │                             │
│  ├───────────────┼───────────────┤                             │
│  │               │               │                             │
│  │     55"       │     55"       │                             │
│  │               │               │                             │
│  └───────────────┴───────────────┘                             │
│                                                                 │
│  Option B: 3x2 (165" diagonal)                                  │
│  ┌─────────┬─────────┬─────────┐                               │
│  │   55"   │   55"   │   55"   │   Good for: 100-250 seats    │
│  ├─────────┼─────────┼─────────┤                               │
│  │   55"   │   55"   │   55"   │                               │
│  └─────────┴─────────┴─────────┘                               │
│                                                                 │
│  Recommended: LG 55UH5J-H (narrow bezel, 24/7 rated)            │
│  Mounting: Chief FUSION XTM1U with video wall brackets          │
│                                                                 │
└─────────────────────────────────────────────────────────────────┘
```

#### Audio System

Spectator audio serves two purposes: commentary/announcements and immersive game audio.

| Zone | Speaker Type | Purpose | Level |
|------|--------------|---------|-------|
| Main Spectator | Ceiling or line array | Commentary, announcements | 85-95 dBA |
| Immersion | Subwoofers | Game audio impact | As needed |
| Gaming Area | Near-field | Player game audio only | 75-85 dBA |

**Audio Signal Flow:**

```
┌─────────────────────────────────────────────────────────────────┐
│  SPECTATOR AUDIO SYSTEM                                         │
│                                                                 │
│  Sources:                                                       │
│  ┌─────────────┐    ┌─────────────┐    ┌─────────────┐         │
│  │ Commentary  │    │  Game Audio │    │   Media     │         │
│  │   (Mixer)   │    │   (Extract) │    │   Player    │         │
│  └──────┬──────┘    └──────┬──────┘    └──────┬──────┘         │
│         │                  │                  │                │
│         └──────────────────┼──────────────────┘                │
│                            ▼                                    │
│                   ┌───────────────┐                             │
│                   │   DSP/Mixer   │                             │
│                   │  (Q-SYS Core) │                             │
│                   └───────┬───────┘                             │
│                           │                                     │
│         ┌─────────────────┼─────────────────┐                   │
│         ▼                 ▼                 ▼                   │
│  ┌────────────┐    ┌────────────┐    ┌────────────┐           │
│  │ Main PA    │    │ Subwoofers │    │ Gaming Area│           │
│  │ Amplifier  │    │ Amplifier  │    │ (isolated) │           │
│  └─────┬──────┘    └─────┬──────┘    └─────┬──────┘           │
│        ▼                 ▼                 ▼                   │
│   Ceiling           Floor-mounted      Near-field              │
│   Speakers          Subs               Monitors                │
│                                                                 │
└─────────────────────────────────────────────────────────────────┘
```

#### Lighting Integration

Esports lighting serves broadcast, player, and spectator needs:

| Zone | Lighting Type | Color Temp | Notes |
|------|---------------|------------|-------|
| Gaming Area | Stage wash | 5600K | Even illumination, no glare on monitors |
| Shoutcaster Desk | Spot wash | 5600K | Key light for camera |
| Spectator Area | Ambient | 3000-4000K | Dimmable, house lights |
| Video Wall | Backlight | RGB | Team colors, dynamic effects |

**Broadcast Lighting Requirements:**
- CRI 90+ for accurate color on camera
- Avoid flicker (high-frequency ballasts or LED)
- Control via DMX from control room
```

**Step 2: Commit**

```bash
git add references/design-patterns.md
git commit -m "docs: add Spectator Experience section for esports facilities"
```

---

## Task 5: Add Room Size Patterns

**Files:**
- Modify: `references/design-patterns.md` (append after Task 4 content)

**Step 1: Add esports room size patterns**

Append to `references/design-patterns.md`:

```markdown

### Esports Facility Room Sizes

#### Small Esports Studio (5-10 stations)

**Use Case:** Practice facility, small competitions, content creation

**Equipment Summary:**
- 5-10 gaming stations with NDI capture
- 1x 75" main display or 2x2 video wall
- 2x Shure MXA920 ceiling microphones
- 1x QSC PTZ 20 camera
- vMix or OBS production (software)
- Single 44RU rack

**Rack Size:** Single 44RU floor rack or wall rack

**Spectator Capacity:** 0-30 (standing or limited seating)

**Network:**
- 1x Netgear M4250-26G4XF-PoE+ (Gaming VLAN)
- 1x Netgear M4250-10G2XF-PoE+ (Broadcast VLAN)

---

#### Competition Arena (10-20 stations)

**Use Case:** Varsity home matches, medium competitions, dual broadcasts

**Equipment Summary:**
- 10-20 gaming stations (2 team rows of 5-10)
- 1x 2x2 video wall (main) + 4x 65" auxiliary displays
- 3-4x Shure MXA920 ceiling microphones
- 2x QSC PTZ 20 cameras (audience + gameplay overview)
- 1x Blackmagic ATEM Constellation 8K
- 1x Behringer X32 or QSC Core 510i
- 2x 44RU racks (gaming + broadcast)

**Rack Size:** Dual 44RU floor racks

**Spectator Capacity:** 50-150 seats

**Network:**
- 2x Netgear M4250-26G4XF-PoE+ (Gaming VLAN per team)
- 1x Netgear M4250-10G2XF-PoE+ (Broadcast VLAN)
- 1x Netgear M4300-8X8F (Fiber backbone to control room)

**Control Room:** Optional but recommended (separate room or corner enclosure)

---

#### Large Esports Arena (20-40 stations)

**Use Case:** Major tournaments, conference championships, multi-game events

**Equipment Summary:**
- 20-40 gaming stations (4+ team rows)
- 1x 3x2 video wall (main) + 8+ auxiliary displays
- 6-8x Shure MXA920 ceiling microphones
- 4x QSC PTZ 20 cameras (multiple angles)
- 1x Blackmagic ATEM Constellation 8K or TriCaster
- 1x Behringer X32 (broadcast) + 1x QSC Core 510i (room)
- Dedicated control room with 4+ racks

**Rack Size:** Dedicated control room (8+ racks total)

**Spectator Capacity:** 150-500 seats

**Network:**
- Dedicated AV network infrastructure
- Fiber backbone between zones
- Redundant core switches

**Control Room:** Required (separate room, minimum 200 sq ft)

**Additional Infrastructure:**
- Dedicated electrical service (200A+)
- HVAC zones for gaming area and control room
- Broadcast-quality lighting grid
```

**Step 2: Commit**

```bash
git add references/design-patterns.md
git commit -m "docs: add Esports Facility Room Size patterns"
```

---

## Task 6: Add Rack Elevation Examples

**Files:**
- Modify: `references/design-patterns.md` (append after Task 5 content)

**Step 1: Add esports rack elevation examples**

Append to `references/design-patterns.md`:

```markdown

### Esports Rack Elevations

#### Gaming Station Rack (per 10 stations)

```
┌────────────────────────────────────────────────────────────────┐
│ RU 44-42: Exhaust Fan Panel (3RU)                              │
├────────────────────────────────────────────────────────────────┤
│ RU 41:    Blank / Ventilation                                  │
├────────────────────────────────────────────────────────────────┤
│ RU 40-39: Netgear M4250-26G4XF-PoE+ (Gaming VLAN)              │
├────────────────────────────────────────────────────────────────┤
│ RU 38:    Blank / Ventilation                                  │
├────────────────────────────────────────────────────────────────┤
│ RU 37-36: Netgear M4250-26G4XF-PoE+ (Broadcast VLAN - NDI)     │
├────────────────────────────────────────────────────────────────┤
│ RU 35:    Blank / Ventilation                                  │
├────────────────────────────────────────────────────────────────┤
│ RU 34-33: Magewell EcoCapture Dual HDMI (NDI encoders)         │
├────────────────────────────────────────────────────────────────┤
│ RU 32:    Blank                                                │
├────────────────────────────────────────────────────────────────┤
│ RU 31:    Q-SYS Core 110f (station audio processing)           │
├────────────────────────────────────────────────────────────────┤
│ RU 30:    SurgeX SX-20 Power Conditioner                       │
├────────────────────────────────────────────────────────────────┤
│ RU 29-1:  Patch Panels, Cable Management                       │
└────────────────────────────────────────────────────────────────┘

Summary:
- Total RU: 44
- Used RU: 14 (equipment)
- Available RU: 30 (cable management, growth)
- Estimated Power: 350W
- Serves: 10 gaming stations
```

#### Broadcast Control Rack

```
┌────────────────────────────────────────────────────────────────┐
│ RU 44-42: Exhaust Fan Panel (3RU)                              │
├────────────────────────────────────────────────────────────────┤
│ RU 41:    Blank / Ventilation                                  │
├────────────────────────────────────────────────────────────────┤
│ RU 40-37: Blackmagic ATEM Constellation 8K (4RU)               │
├────────────────────────────────────────────────────────────────┤
│ RU 36:    Blank / Ventilation                                  │
├────────────────────────────────────────────────────────────────┤
│ RU 35-34: Blackmagic HyperDeck Studio 4K Pro (recording)       │
├────────────────────────────────────────────────────────────────┤
│ RU 33:    Blank / Ventilation                                  │
├────────────────────────────────────────────────────────────────┤
│ RU 32-31: Behringer X32 (Broadcast Audio Mixer)                │
├────────────────────────────────────────────────────────────────┤
│ RU 30:    Dante AVIO 2x2 (Audio bridge)                        │
├────────────────────────────────────────────────────────────────┤
│ RU 29:    Blank / Ventilation                                  │
├────────────────────────────────────────────────────────────────┤
│ RU 28-27: Netgear M4300-8X8F (Fiber backbone)                  │
├────────────────────────────────────────────────────────────────┤
│ RU 26:    Blank                                                │
├────────────────────────────────────────────────────────────────┤
│ RU 25-24: Teradek Prism (Stream Encoder - Primary)             │
├────────────────────────────────────────────────────────────────┤
│ RU 23-22: Teradek Prism (Stream Encoder - Backup)              │
├────────────────────────────────────────────────────────────────┤
│ RU 21:    Blank / Ventilation                                  │
├────────────────────────────────────────────────────────────────┤
│ RU 20:    Clear-Com MS-702 (Intercom Main Station)             │
├────────────────────────────────────────────────────────────────┤
│ RU 19:    SurgeX SX-AX20 Power Sequencer                       │
├────────────────────────────────────────────────────────────────┤
│ RU 18-1:  Patch Panels, Intercom, Cable Management             │
└────────────────────────────────────────────────────────────────┘

Summary:
- Total RU: 44
- Used RU: 26 (equipment)
- Available RU: 18 (cable management, growth)
- Estimated Power: 800W
- Dedicated 20A circuit recommended
```

#### Spectator Audio/Display Rack

```
┌────────────────────────────────────────────────────────────────┐
│ RU 44-42: Exhaust Fan Panel (3RU)                              │
├────────────────────────────────────────────────────────────────┤
│ RU 41:    Blank / Ventilation                                  │
├────────────────────────────────────────────────────────────────┤
│ RU 40-39: QSC CXD4.5Q Amplifier (Main PA)                      │
├────────────────────────────────────────────────────────────────┤
│ RU 38:    Blank / Ventilation                                  │
├────────────────────────────────────────────────────────────────┤
│ RU 37-36: QSC CXD4.3Q Amplifier (Subwoofers)                   │
├────────────────────────────────────────────────────────────────┤
│ RU 35:    Blank / Ventilation                                  │
├────────────────────────────────────────────────────────────────┤
│ RU 34:    Crestron HD-DA4-4KZ-E (Display Distribution)         │
├────────────────────────────────────────────────────────────────┤
│ RU 33:    Crestron HD-DA4-4KZ-E (Display Distribution)         │
├────────────────────────────────────────────────────────────────┤
│ RU 32:    Q-SYS Core 110f (Spectator DSP)                      │
├────────────────────────────────────────────────────────────────┤
│ RU 31:    Netgear M4250-10G2XF-PoE+ (Display VLAN)             │
├────────────────────────────────────────────────────────────────┤
│ RU 30:    SurgeX SX-20 Power Conditioner                       │
├────────────────────────────────────────────────────────────────┤
│ RU 29-1:  Patch Panels, Cable Management                       │
└────────────────────────────────────────────────────────────────┘

Summary:
- Total RU: 44
- Used RU: 16 (equipment)
- Available RU: 28 (cable management, growth)
- Estimated Power: 1200W
- Dedicated 20A circuit required
```
```

**Step 2: Commit**

```bash
git add references/design-patterns.md
git commit -m "docs: add Esports rack elevation examples"
```

---

## Task 7: Update SKILL.md Triggers

**Files:**
- Modify: `SKILL.md` (lines 46-62 trigger section)

**Step 1: Add esports trigger keywords**

Update the trigger section in `SKILL.md` to include esports examples:

Find the trigger section (around lines 46-62) and add esports trigger examples:

```markdown
/av-design-engineering-skill Design an esports arena for 20 gaming stations
/av-design-engineering-skill Create AV for a competitive gaming facility with spectator seating
Design an esports broadcast control room
Create a BOM for a varsity gaming lab
```

Also add to the natural language triggers:

```markdown
- "Design [esports arena / gaming facility / competition studio]"
- "Create [esports AV / gaming broadcast / shoutcaster setup]"
```

**Step 2: Update description frontmatter**

Update the description in the frontmatter (lines 3-13) to include esports keywords:

Add after "higher education AV":
```markdown
, esports facility, gaming arena, competitive gaming, shoutcaster setup, broadcast control room
```

**Step 3: Commit**

```bash
git add SKILL.md
git commit -m "feat: add esports trigger keywords to SKILL.md"
```

---

## Task 8: Add Esports Equipment to Database

**Files:**
- Modify: `assets/equipment-database.csv` (append rows)

**Step 1: Add esports-specific equipment**

Append to `assets/equipment-database.csv`:

```csv
Processing & Control,Blackmagic,ATEM Constellation 8K,40-input M/E production switcher,SDI,HDMI,NDI,AC Mains,400,4,Broadcast production switcher for large esports arenas
Processing & Control,Blackmagic,ATEM Mini Extreme ISO,8-input HDMI switcher with recording,HDMI,USB-C,AC Mains,35,1,Compact switcher for small esports studios
Processing & Control,vMix,vMix HD,Software production switcher,NDI,HDMI,USB,N/A,0,0,PC-based software switcher for budget productions
Processing & Control,TriCaster,TC2 Elite,32-input NDI production system,NDI,SDI,AC Mains,500,4,Enterprise-grade production for multi-venue esports
Processing & Control,Magewell,EcoCapture Dual HDMI,Dual NDI encoder card,HDMI,NDI,PCIe,15,0,Low-latency NDI capture for gaming PCs
Processing & Control,AVerMedia,Live Gamer 4K 2.1,HDMI 2.1 capture card,HDMI,USB 3.0,PCIe,10,0,4K120 capture for next-gen gaming
Video,ASUS,ROG Swift PG27AQN,27 1440p 360Hz gaming monitor,DisplayPort,HDMI,AC Mains,50,0,Tournament-grade esports monitor
Video,BenQ,Zowie XL2566K,24.5 1080p 360Hz gaming monitor,DisplayPort,HDMI,AC Mains,45,0,Professional esports tournament monitor
Video,LG,UltraGear 27GP950-B,27 4K 144Hz gaming monitor,HDMI,DisplayPort,USB,AC Mains,40,0,High-resolution gaming display
Infrastructure & Rack,Teradek,Prism,Multi-platform H.265 encoder,SDI,HDMI,NDI,AC Mains,25,1,Hardware streaming encoder
Infrastructure & Rack,Makito,X Encoder,Quad 4K60 streaming encoder,SDI,HDMI,NDI,AC Mains,75,1,Enterprise broadcast encoder
Infrastructure & Rack,Blackmagic,HyperDeck Studio 4K Pro,Broadcast recorder with H.265,SDI,HDMI,AC Mains,35,2,Production recording and backup
Infrastructure & Rack,Clear-Com,MS-702,Two-channel intercom main station,Analog,XLR,AC Mains,40,2,Production intercom system
Infrastructure & Rack,Clear-Com,RS-701,Single-channel beltpack intercom,Analog,XLR,DC Power,5,0,Shoutcaster beltpack
Infrastructure & Rack,Riedel,Bolero SW,Wireless intercom beltpack,DECT,Dante,DC Power,8,0,Wireless production intercom
Audio,Shure,SM7B,Broadcast dynamic microphone,Analog XLR,Phantom,0,0,Industry-standard broadcast mic for shoutcasters
Audio,Rode,PodMic,Broadcast dynamic microphone,Analog XLR,Phantom,0,0,Budget broadcast microphone
Audio,Audio-Technica,BP40,Broadcast dynamic microphone,Analog XLR,Phantom,0,0,Professional broadcast microphone
Infrastructure & Rack,Behringer,X32,32-channel digital mixer,Dante,Analog XLR,USB,AC Mains,120,4,Broadcast audio mixer
```

**Step 2: Commit**

```bash
git add assets/equipment-database.csv
git commit -m "feat: add esports-specific equipment to database"
```

---

## Task 9: Update README.md

**Files:**
- Modify: `README.md` (target environments and examples)

**Step 1: Add esports to target environments**

Update the Target Environments section in README.md to include:

```markdown
- Esports arenas and gaming facilities
- Broadcast control rooms
```

**Step 2: Add esports example**

Add an esports example to the Usage section:

```markdown
/av-design-engineering-skill Design an esports arena for 20 gaming stations with spectator seating
```

**Step 3: Commit**

```bash
git add README.md
git commit -m "docs: add esports to README target environments and examples"
```

---

## Task 10: Final Verification

**Files:**
- Read: `references/design-patterns.md` (verify structure)
- Read: `SKILL.md` (verify triggers)
- Read: `assets/equipment-database.csv` (verify entries)

**Step 1: Verify design-patterns.md structure**

Run: Read the file and confirm:
- [ ] Esports section follows existing format
- [ ] Mermaid diagrams render correctly
- [ ] All tables formatted properly
- [ ] Rack elevations consistent with existing patterns

**Step 2: Verify SKILL.md updates**

Run: Read the file and confirm:
- [ ] Esports trigger examples added
- [ ] Description frontmatter updated with esports keywords

**Step 3: Verify equipment database**

Run: `wc -l assets/equipment-database.csv`
Expected: 80+ lines (original 65 + new esports entries)

**Step 4: Final commit**

```bash
git add -A
git commit -m "feat: complete esports facility design patterns"
```

---

## Summary

| Task | Description | Files Modified |
|------|-------------|----------------|
| 1 | Esports Architecture Section | `references/design-patterns.md` |
| 2 | Gaming Station Standards | `references/design-patterns.md` |
| 3 | Broadcast/Streaming Production | `references/design-patterns.md` |
| 4 | Spectator Experience | `references/design-patterns.md` |
| 5 | Room Size Patterns | `references/design-patterns.md` |
| 6 | Rack Elevation Examples | `references/design-patterns.md` |
| 7 | SKILL.md Triggers | `SKILL.md` |
| 8 | Equipment Database | `assets/equipment-database.csv` |
| 9 | README Updates | `README.md` |
| 10 | Final Verification | All files |

**Total Lines Added:** ~400 lines (design-patterns.md), ~20 lines (equipment-database.csv)
