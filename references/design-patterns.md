# Design Patterns for Higher Education AV

This document outlines established design patterns for HyFlex, distance learning, and standardized rack layouts in Higher Education environments.

## HyFlex Architecture

HyFlex (Hybrid-Flexible) architecture enables simultaneous in-person and remote participation in the same class session. Students choose how to participate: in-person, synchronous online, or asynchronous.

### Core Principles

1. **Equivalency:** Remote and in-person experiences are equally valuable
2. **Affordance:** Technology serves pedagogy, not the reverse
3. **Scalability:** Solution works for 20-seat classrooms to 300-seat lecture halls
4. **Simplicity:** Minimal instructor intervention required

### Signal Flow Architecture

```
┌─────────────────────────────────────────────────────────────────────┐
│                         HYFLEX SIGNAL FLOW                          │
├─────────────────────────────────────────────────────────────────────┤
│                                                                     │
│  SOURCES                          PROCESSING                        │
│  ┌─────────┐    ┌─────────┐      ┌─────────────────────────────┐   │
│  │ Ceiling │───▶│         │      │                             │   │
│  │   Mics  │    │         │      │  DSP with AEC               │   │
│  └─────────┘    │  Dante  │─────▶│  - Acoustic Echo Cancel     │   │
│                 │  Switch │      │  - Noise Reduction          │   │
│  ┌─────────┐    │         │      │  - Automatic Gain Control   │   │
│  │ Wireless│───▶│         │      │  - USB Bridging to PC       │   │
│  │   Mics  │    └─────────┘      └─────────────────────────────┘   │
│  └─────────┘                            │                          │
│                                         ▼                          │
│  ┌─────────┐                     ┌─────────────┐                   │
│  │  PTZ    │───▶ Room PC ───────▶│ USB Audio   │───▶ Zoom/Teams   │
│  │ Camera  │                     │ Bridge      │                   │
│  └─────────┘                     └─────────────┘                   │
│                                        │                           │
│  ┌─────────┐                           ▼                           │
│  │ Doc Cam │───▶ Room PC ───────▶ HDMI Switch                      │
│  └─────────┘                           │                           │
│                                        ▼                           │
│  ┌─────────┐                     ┌─────────────┐                   │
│  │ Laptop  │───▶ HDMI Switch ──▶│ Distribution│───▶ Displays      │
│  │ (HDMI)  │                     │ Amplifier   │───▶ Projector     │
│  └─────────┘                     └─────────────┘                   │
│                                        │                           │
│                                        ▼                           │
│                                  ┌─────────────┐                   │
│                                  │  Amplifier  │───▶ Ceiling       │
│                                  │             │     Speakers      │
│                                  └─────────────┘                   │
│                                                                     │
└─────────────────────────────────────────────────────────────────────┘
```

### Critical Path: AEC and USB Bridging

All microphone signals MUST pass through DSP with AEC before reaching the soft codec (Zoom/Teams).

**Why AEC is critical:**
- Remote participant audio plays through room speakers
- Microphones pick up this audio
- Without AEC, remote participants hear their own voice delayed (echo)
- AEC removes the speaker output from the microphone signal

**USB Bridging options:**
- QSC Q-SYS: Native USB audio bridging in Core processors
- Biamp Tesira: USB audio bridging in TesiraFORTE
- Extron DMP: USB audio bridging in DMP series
- Shure: USB audio via MXA920 + IntelliMix P300

### Camera Coverage Requirements

| Room Size | Camera Type | Coverage |
|-----------|-------------|----------|
| Small (20-30 seats) | Single PTZ | Instructor + whiteboard |
| Medium (30-60 seats) | Dual PTZ | Instructor + student area |
| Large (60-150 seats) | Multiple PTZ | Instructor + wide + close-up |
| Lecture Hall (150+ seats) | PTZ + tracking | Instructor tracking + audience |

### Display Strategy

| Room Type | Primary Display | Secondary Display |
|-----------|-----------------|-------------------|
| Classroom | 75-86" display | Optional confidence monitor |
| Lecture Hall | Dual projection or large video wall | Confidence monitor |
| Auditorium | Large projection | Dual screens for side seating |

## Distance Learning Room Types

### Zoom Rooms / Teams Rooms

**Standard Components:**
1. Room PC with Zoom/Teams software
2. Certified camera (QSC, Crestron, Logitech)
3. Certified microphone array (Shure, Sennheiser, Biamp)
4. DSP with AEC
5. Display(s) for content and far-end video
6. Touch controller for room scheduling

**Signal Flow:**
```
Mics → DSP (AEC) → USB → Room PC → Zoom/Teams
Camera → USB → Room PC → Zoom/Teams
Room PC → HDMI → Display
Zoom/Teams → DSP → Amplifier → Speakers
```

### Lecture Capture Rooms

**Standard Components:**
1. Panopto/Kaltura/Lecture Capture appliance
2. Camera (PTZ or fixed)
3. Microphone(s) with DSP
4. Content source capture (HDMI)
5. Recording management integration

**Signal Flow:**
```
Mics → DSP → Dante → Capture Appliance
Camera → HDMI/SDI → Capture Appliance
Content → HDMI → Capture Appliance
Capture Appliance → Network → Media Server
```

### HyFlex Classroom (Full Featured)

**Standard Components:**
1. Room PC with Zoom/Teams
2. Ceiling microphone array with AEC
3. PTZ camera with instructor tracking
4. Dual displays (content + far-end)
5. Document camera
6. Wireless presentation (Mersive, Barco)
7. Control system touch panel

## Standardized Rack Layouts

### Rack Thermal Management

**Rules:**
1. 1RU blank above all heat-generating equipment (processors, amplifiers)
2. Exhaust fans at top of rack (pull configuration)
3. Intake at bottom of rack
4. Cable management prevents airflow blockage
5. Rack temperature should not exceed 95°F (35°C)

**Layout Pattern (Top to Bottom):**
```
RU 44-42: Exhaust fans (if equipped)
RU 41:    Blank
RU 40-39: Amplifier #1
RU 38:    Blank
RU 37-36: Amplifier #2
RU 35:    Blank
RU 34-33: DSP/Processor
RU 32:    Blank
RU 31-30: Network switch
RU 29:    Blank
RU 28:    Power sequencing
RU 27-20: Source equipment, streaming appliances
RU 19-1:  Patch panels, cable management, storage
```

### Power Conditioning

**Required:**
- Surge protection at rack input (SurgeX SX-20 or equivalent)
- Power sequencing for multiple amplifiers
- Dedicated 20A circuit for racks with amplifiers
- UPS for control processor and network switch

**Power Sequencing:**
1. Control processor (always on via UPS)
2. Network switch (always on via UPS)
3. Sources (delayed startup)
4. DSP (delayed startup)
5. Amplifiers (last to power on, first to power off)

### Cable Management

**Standards:**
- Vertical cable managers on both sides of rack
- Horizontal cable managers between equipment groups
- Service loops: 6-12" at each termination
- Labeling: Both ends, machine-printed
- Color coding: By signal type (audio, video, control, network)

**Cable Labeling Format:**
```
[Source Device]-[Source Port] → [Destination Device]-[Destination Port]

Examples:
DSP-OUT1 → AMP-IN1
SW-P1 → CAM-DANTE1
CTRL-RS232 → DISP-CTRL
```

### Example Rack Elevations

#### Small Classroom Rack (22RU)

```
┌────────────────────────────────────────┐
│ RU 22: Exhaust Fan Panel               │
├────────────────────────────────────────┤
│ RU 21: Blank / Ventilation             │
├────────────────────────────────────────┤
│ RU 20-19: QSC CXD4.3Q Amplifier        │
├────────────────────────────────────────┤
│ RU 18: Blank / Ventilation             │
├────────────────────────────────────────┤
│ RU 17: Q-SYS Core 110f                 │
├────────────────────────────────────────┤
│ RU 16: Blank / Ventilation             │
├────────────────────────────────────────┤
│ RU 15-14: Netgear M4250-26G4XF-PoE+    │
├────────────────────────────────────────┤
│ RU 13: SurgeX SX-20 Power Conditioner  │
├────────────────────────────────────────┤
│ RU 12-11: Crestron DM-NVX-D30 Decoder  │
├────────────────────────────────────────┤
│ RU 10: Blank                           │
├────────────────────────────────────────┤
│ RU 9-8:  Extron IN1808 Switcher        │
├────────────────────────────────────────┤
│ RU 7-1:  Cable Management / Patch      │
└────────────────────────────────────────┘

Summary:
- Total RU: 22
- Used RU: 14 (equipment)
- Available RU: 8 (cable management, blanks, growth)
- Estimated Power: 650W
```

#### Large Lecture Hall Rack (44RU)

```
┌────────────────────────────────────────┐
│ RU 44-42: Exhaust Fan Panel (3RU)      │
├────────────────────────────────────────┤
│ RU 41: Blank / Ventilation             │
├────────────────────────────────────────┤
│ RU 40-39: QSC CXD4.5Q Amplifier #1     │
├────────────────────────────────────────┤
│ RU 38: Blank / Ventilation             │
├────────────────────────────────────────┤
│ RU 37-36: QSC CXD4.5Q Amplifier #2     │
├────────────────────────────────────────┤
│ RU 35: Blank / Ventilation             │
├────────────────────────────────────────┤
│ RU 34: SurgeX SX-AX20 Power Sequencer  │
├────────────────────────────────────────┤
│ RU 33: Blank / Ventilation             │
├────────────────────────────────────────┤
│ RU 32: Q-SYS Core 510i                 │
├────────────────────────────────────────┤
│ RU 31: Blank / Ventilation             │
├────────────────────────────────────────┤
│ RU 30-29: Netgear M4250-10G2XF-PoE+    │
├────────────────────────────────────────┤
│ RU 28-27: Netgear M4300-8X8F (Fiber)   │
├────────────────────────────────────────┤
│ RU 26: Blank                           │
├────────────────────────────────────────┤
│ RU 25-24: Crestron DM-NVX-E30 Encoder  │
├────────────────────────────────────────┤
│ RU 23-22: Crestron DM-NVX-D30 Decoder  │
├────────────────────────────────────────┤
│ RU 21: Blank                           │
├────────────────────────────────────────┤
│ RU 20-19: Extron IN1808 Switcher       │
├────────────────────────────────────────┤
│ RU 18-17: Shure ULXD4Q Receiver        │
├────────────────────────────────────────┤
│ RU 16-15: Streaming Appliance          │
├────────────────────────────────────────┤
│ RU 14-1: Cable Management / Panels     │
└────────────────────────────────────────┘

Summary:
- Total RU: 44
- Used RU: 28 (equipment)
- Available RU: 16 (cable management, blanks, growth)
- Estimated Power: 1800W
- Dedicated 20A circuit required
```

## Room Size Design Patterns

### Small Classroom (20-30 seats)

**Equipment:**
- 1x 75" display
- 1x Shure MXA920 ceiling microphone
- 1x QSC PTZ 12 camera
- 1x Q-SYS Core 110f
- 1x Netgear M4250-26G4XF-PoE+
- 2x QSC AD-C6T-LP speakers
- 1x QSC CXD4.3Q amplifier

**Rack Size:** 22RU wall rack

### Medium Classroom (30-60 seats)

**Equipment:**
- 1x 86" display or dual 65" displays
- 2x Shure MXA920 ceiling microphones
- 1x QSC PTZ 20 camera
- 1x Q-SYS Core 110f
- 1x Netgear M4250-26G4XF-PoE+
- 4x QSC AD-C6T-LP speakers
- 1x QSC CXD4.3Q amplifier

**Rack Size:** 22RU floor rack

### Large Lecture Hall (60-150 seats)

**Equipment:**
- 2x 86" displays OR dual projection
- 3-4x Shure MXA920 ceiling microphones
- 2x QSC PTZ 20 cameras (instructor + student)
- 1x Q-SYS Core 510i
- 1x Netgear M4250-10G2XF-PoE+
- 1x Netgear M4300-8X8F (fiber backbone)
- 8x QSC AD-C8T-LP speakers
- 2x QSC CXD4.5Q amplifiers

**Rack Size:** 44RU floor rack

### Auditorium (150+ seats)

**Equipment:**
- Dual projection system
- 4-6x Shure MXA920 ceiling microphones
- 3-4x QSC PTZ 20 cameras
- 1x Q-SYS Core 510i
- Dedicated AV network infrastructure
- 12-16x QSC AD-C8T-LP speakers
- 3-4x QSC CXD4.5Q amplifiers
- Wireless microphone system (4+ channels)

**Rack Size:** Dual 44RU racks

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
