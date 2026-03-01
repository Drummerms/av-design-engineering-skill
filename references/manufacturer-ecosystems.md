# Manufacturer Ecosystems

This document outlines compatible product groupings to minimize bridging hardware and single points of failure. When possible, group equipment from the same manufacturer ecosystem.

## QSC Ecosystem

### Overview

QSC provides a complete AV ecosystem centered around Q-SYS platform with native integration between processors, amplifiers, cameras, and loudspeakers.

### Core Components

| Category | Product | Integration |
|----------|---------|-------------|
| DSP/Control | Q-SYS Core 110f | Central processor, USB bridging, control |
| DSP/Control | Q-SYS Core 510i | Higher I/O for large venues |
| Amplifier | CXD Series (Dante) | Native Dante, Q-SYS control |
| Amplifier | CXD-Q Series | Native Q-SYS, no Dante license needed |
| Camera | PTZ 12, PTZ 20, NC Series | Native Q-SYS control, USB/HDMI/Dante |
| Loudspeaker | AD Series | 70V/100V, EASE data available |
| Microphone | Third-party Dante (Shure, Sennheiser) | Via Dante network |

### Native Integrations

```
Q-SYS Core
    ├── Native USB Audio Bridging (no external hardware)
    ├── Native AEC Processing (up to 16 channels)
    ├── Native QSC Camera Control (PTZ, presets, tracking)
    ├── Native QSC Amplifier Control (monitoring, DSP)
    └── Dante Audio Networking (to third-party devices)
```

### Recommended Combinations

**Small Room (20-30 seats):**
- Q-SYS Core 110f
- Shure MXA920 (Dante)
- QSC PTZ 12 camera
- CXD4.3Q amplifier
- AD-C6T-LP speakers (4)

**Medium Room (30-60 seats):**
- Q-SYS Core 110f
- Shure MXA920 (2x, Dante)
- QSC PTZ 20 camera
- CXD4.3Q amplifier
- AD-C8T-LP speakers (4-6)

**Large Room (60-150 seats):**
- Q-SYS Core 510i
- Shure MXA920 (3-4x, Dante)
- QSC PTZ 20 cameras (2x)
- CXD4.5Q amplifiers (2x)
- AD-C8T-LP speakers (8-12)

### QSC Advantages

- Single-vendor support for DSP, amplifiers, cameras
- Native USB bridging eliminates external hardware
- No Dante licensing fees on CXD-Q amplifiers
- Comprehensive Q-SYS Designer software

---

## Crestron Ecosystem

### Overview

Crestron provides complete AV and control solutions with tight integration between control processors, NVX video distribution, and room systems.

### Core Components

| Category | Product | Integration |
|----------|---------|-------------|
| Control | CP4, CP4N | 4-Series control processor |
| DSP | DM-NAXX Series | Dante-enabled audio processor |
| Video | DM-NVX Series | Network AV encoder/decoder |
| Camera | CCS Series | USB/HDMI cameras |
| Touch Panel | TS/TSW Series | Control interface |
| Switcher | DM Series | DigitalMedia switchers |

### Native Integrations

```
Crestron CP4N
    ├── Native NVX Control (video distribution)
    ├── Native DM-NAXX Control (audio DSP)
    ├── Native Display Control (RS-232, TCP/IP, CEC)
    ├── Native Camera Control (VISCA, TCP/IP)
    └── Native Zoom Rooms API
```

### Recommended Combinations

**Zoom Room (Small):**
- Crestron CP4N
- Crestron CCS-UC-1 camera
- Crestron UC Audio (integrated DSP + speakers)
- Crestron TSW-1070 touch panel

**Lecture Hall (Large):**
- Crestron CP4N
- Crestron DM-NAXX-16, DSP (Dante + AEC)
- Crestron NVX encoders/decoders
- Crestron CCS-4K-PTZ cameras
- Crestron DM switcher

### Crestron Advantages

- Industry-standard control platform
- Comprehensive Zoom/Teams certification
- Extensive driver library
- Enterprise support infrastructure

---

## Extron Ecosystem

### Overview

Extron provides video switching, signal processing, and audio DSP with strong focus on education markets.

### Core Components

| Category | Product | Integration |
|----------|---------|-------------|
| Control | IPCP Pro Series | Control processor |
| DSP | DMP Series | Digital matrix processor |
| Switcher | IN Series | Input switchers/scalers |
| Extender | DTP/XTP Series | Signal extenders |
| Amplifier | XPA Series | Professional amplifiers |

### Native Integrations

```
Extron IPCP Pro
    ├── Native DMP Control (audio DSP)
    ├── Native IN Series Control (switching)
    ├── Native Display Control (RS-232, TCP/IP, CEC)
    └── Global Scripter (Python programming)
```

### Recommended Combinations

**Presentation Room:**
- Extron IPCP Pro 250
- Extron DMP 64 (DSP with AEC)
- Extron IN1808 (switcher/scaler)
- Extron DTP2 extenders
- Extron XPA 2003C amplifier

### Extron Advantages

- Strong presentation switching solutions
- Excellent scaler technology
- Competitive pricing for education
- Extensive training resources

---

## Shure Ecosystem

### Overview

Shure specializes in microphone solutions with comprehensive Dante integration and DSP options.

### Core Components

| Category | Product | Integration |
|----------|---------|-------------|
| Ceiling Mic | MXA920 | Dante, beamforming |
| Linear Array | MXA710 | Dante, steerable |
| Wireless | ULXD Series | Dante option |
| Wireless | ADX Series | Dante, ShowLink |
| DSP | IntelliMix P300 | AEC, Dante, USB |

### Recommended Combinations

**Standalone System (Shure-only DSP):**
- Shure MXA920 (2x)
- Shure IntelliMix P300 (AEC + USB)
- Direct USB connection to Room PC

**Integrated System (Third-party DSP):**
- Shure MXA920 (2x)
- Q-SYS Core 110f (AEC + USB)
- Dante network to switch

### Shure Advantages

- Industry-leading microphone technology
- Comprehensive Dante integration
- Excellent beamforming algorithms
- Wide coverage area per microphone

---

## Sennheiser Ecosystem

### Overview

Sennheiser provides premium microphone solutions with TeamConnect ceiling array and EW-DX wireless systems.

### Core Components

| Category | Product | Integration |
|----------|---------|-------------|
| Ceiling Mic | TeamConnect Ceiling 2 | Dante, beamforming |
| Wireless | EW-DX Series | Digital, Dante |
| Bodypack | EW-DX SK | Digital transmitter |

### Recommended Combinations

**Premium Classroom:**
- Sennheiser TeamConnect Ceiling 2
- Sennheiser EW-DX (4 channels)
- Q-SYS Core or Biamp Tesira for DSP

### Sennheiser Advantages

- Premium audio quality
- TruVoiceLift technology
- Comprehensive wireless options
- Strong European support

---

## Biamp Ecosystem

### Overview

Biamp provides DSP solutions with Tesira platform and Parlé microphone line.

### Core Components

| Category | Product | Integration |
|----------|---------|-------------|
| DSP | TesiraFORTE | AEC, Dante, USB |
| DSP | TesiraLUX | Video over IP |
| Ceiling Mic | Parlé TCM-XA | Beamtracking, Dante |
| Table Mic | Parlé TTM-XA | Beamtracking, Dante |

### Recommended Combinations

**Biamp System:**
- Biamp Parlé TCM-XA (2x)
- Biamp TesiraFORTE AI
- Direct USB to Room PC

### Biamp Advantages

- Beamtracking technology
- Comprehensive DSP features
- Competitive pricing
- Strong education presence

---

## Network Infrastructure

### Netgear AV-Line (Recommended)

Netgear AV-Line switches are optimized for AV-over-IP applications with pre-configured settings for Dante, SDVoP, and NVX.

| Model | Ports | PoE Budget | Use Case |
|-------|-------|------------|----------|
| M4250-26G4XF-PoE+ | 24x 1G + 4x SFP28 | 380W | Small-Medium rooms |
| M4250-10G2XF-PoE+ | 8x 10G + 2x SFP+ | 240W | Large rooms |
| M4300-8X8F | 8x 10G SFP+ | N/A | Fiber backbone |

### AV-Optimized Features

- IGMP Snooping enabled by default
- QoS profiles for Dante (DSCP 46)
- VLAN pre-configuration
- Quiet fan operation

### Power Budget Calculation

```
Example: 4 cameras (15W each) + 4 mics (12W each) = 108W
Required switch budget: 108W × 1.25 = 135W minimum
Netgear M4250-26G4XF-PoE+ (380W) provides 2.8x headroom
```

---

## Cross-Ecosystem Integration

### When to Mix Ecosystems

| Scenario | Recommendation |
|----------|----------------|
| Budget constraints | Extron switcher + Shure mics + QSC DSP |
| Existing infrastructure | Match new equipment to existing |
| Specific feature requirements | Choose best-of-breed per category |
| Support contract requirements | Align with existing vendor relationships |

### Common Mixed Configurations

**Budget-Conscious:**
- Shure MXA920 (mics)
- Q-SYS Core 110f (DSP)
- Extron IN1808 (switcher)
- Netgear AV-Line (network)

**Performance-Conscious:**
- Sennheiser TCC2 (mics)
- Q-SYS Core 510i (DSP)
- Crestron NVX (video)
- Netgear AV-Line (network)

**Support-Simplified:**
- Crestron end-to-end
- or QSC end-to-end

---

## Rack Infrastructure

### Middle Atlantic (Recommended)

Middle Atlantic provides AV-specific rack solutions with thermal management and cable management built in.

| Product | Type | Use Case |
|---------|------|----------|
| MRK-4436 | Floor rack | Large installations |
| MRK-2236 | Floor rack | Medium installations |
| DVWD-18 | Wall rack | Small installations |
| UCT Series | Cable trough | Vertical management |
| QUIKPULL | Rails | Tool-free mounting |

### Thermal Accessories

- Rack fans (top-mounted exhaust)
- Vent panels
- Temperature monitoring

---

## Display Infrastructure

### Chief (Recommended)

Chief provides commercial mounting solutions for displays and projectors.

| Product | Type | Use Case |
|---------|------|----------|
| FUSION XTM1U | Tilt wall mount | 37-80" displays |
| WSWM70 | Wide-span | Dual displays |
| PTRU | Pull-through rack | Rack-mounted displays |
| LTM1U | Low-profile | Close-to-wall mounting |

### Projector Mounts

- Flush mount (low ceilings)
- Extended column (high ceilings)
- Structural adapter (open ceiling)
