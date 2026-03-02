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

---

## Esports Production Ecosystems

Esports facilities require specialized broadcast production infrastructure alongside traditional AV systems. These ecosystems support competitive gaming, live streaming, and spectator engagement.

### Blackmagic Design Ecosystem

#### Overview

Blackmagic Design provides broadcast-grade production equipment at accessible price points, making it ideal for Higher Education esports programs.

#### Core Components

| Category | Product | Integration |
|----------|---------|-------------|
| Production Switcher | ATEM Constellation 8K | 40-input M/E switcher, SDI/HDMI/NDI |
| Production Switcher | ATEM Mini Extreme ISO | 8-input compact switcher with recording |
| Recording | HyperDeck Studio 4K Pro | Broadcast recorder with H.265 |
| Capture | DeckLink 8K Pro | PCIe capture card, SDI/HDMI |
| Monitoring | SmartView 4K | Multi-format broadcast monitors |

#### Native Integrations

```
Blackmagic ATEM Constellation
    ├── Native SDI switching (12G-SDI)
    ├── Native HDMI conversion
    ├── NDI input/output support
    ├── ATEM Software Control (free)
    └── HyperDeck recording integration
```

#### Recommended Combinations

**Large Esports Arena:**
- Blackmagic ATEM Constellation 8K
- Blackmagic HyperDeck Studio 4K Pro (2x, recording)
- Blackmagic SmartView 4K (multi-view)
- SDI infrastructure throughout

**Small Esports Studio:**
- Blackmagic ATEM Mini Extreme ISO
- Direct HDMI from gaming PCs
- USB-C recording to external SSD

#### Blackmagic Advantages

- Professional broadcast quality at education pricing
- No licensing fees for software control
- Extensive input/output flexibility
- Strong community and tutorial resources

---

### vMix Ecosystem

#### Overview

vMix is a software-based production system that runs on Windows PCs, providing a cost-effective solution for smaller esports facilities with flexible NDI integration.

#### Core Components

| Category | Product | Integration |
|----------|---------|-------------|
| Software | vMix HD | 4K switching, streaming, recording |
| Software | vMix 4K | 4K support, additional inputs |
| Software | vMix Pro | Full feature set, unlimited inputs |
| Hardware | vMix Call | Built-in video conferencing |
| Hardware | vMix Replay | Slow-motion replay system |

#### Native Integrations

```
vMix Software
    ├── NDI input/output (unlimited sources)
    ├── Direct streaming to Twitch/YouTube/Facebook
    ├── Virtual inputs (video calls, screen capture)
    ├── Built-in titling and graphics
    └── Multi-camera replay (vMix Replay)
```

#### Recommended Combinations

**Budget Esports Production:**
- vMix 4K license
- High-performance PC (i9, RTX 4080, 64GB RAM)
- NDI capture from gaming PCs (software encoders)
- Direct streaming to platforms

**Hybrid Production:**
- vMix Pro license
- Blackmagic DeckLink capture cards
- NDI PTZ cameras for shoutcaster area
- vMix Call for remote commentators

#### vMix Advantages

- Low entry cost for software-based production
- Flexible NDI integration
- All-in-one solution (switching, streaming, recording)
- Regular updates and feature additions

---

### TriCaster Ecosystem (NewTek/Vizrt)

#### Overview

TriCaster provides enterprise-grade production systems for professional broadcast, suitable for large-scale esports events and multi-venue production.

#### Core Components

| Category | Product | Integration |
|----------|---------|-------------|
| Production | TriCaster TC2 Elite | 32 NDI inputs, 16 SDI, unlimited outputs |
| Production | TriCaster Mini X | Compact 4-input production system |
| Graphics | LiveText | Character generator |
| Virtual Sets | Virtual Set Editor | Custom virtual environments |
| Storage | NDI Video Hub | Shared storage for NDI workflows |

#### Native Integrations

```
TriCaster TC2 Elite
    ├── Native NDI input/output
    ├── Native SDI I/O (16 channels)
    ├── Built-in streaming encoders
    ├── Virtual sets and AR graphics
    ├── Multi-destination streaming
    └── LiveText graphics integration
```

#### Recommended Combinations

**Multi-Venue Production:**
- TriCaster TC2 Elite (main production)
- NDI video hub (shared storage)
- TriCaster Mini X (satellite venues)
- NDI PTZ cameras throughout

**Professional Broadcast:**
- TriCaster TC2 Elite
- Virtual Set Editor (custom branding)
- LiveText (graphics)
- NDI network infrastructure

#### TriCaster Advantages

- Enterprise-grade reliability
- Advanced virtual set capabilities
- Multi-venue production support
- Professional graphics and titling
- Vizrt support infrastructure

---

### Streaming Encoder Ecosystems

#### Teradek

Teradek provides hardware streaming encoders optimized for multi-platform broadcast.

| Product | Inputs | Outputs | Use Case |
|---------|--------|---------|----------|
| Prism | SDI, HDMI, NDI | Multi-platform RTMP | Primary streaming |
| Prism Plus | SDI, HDMI, NDI | Bonded cellular | Mobile production |
| Cube | SDI, HDMI | RTMP, SRT | Budget streaming |

**Advantages:**
- Hardware encoding (no CPU overhead)
- Bonded cellular option for redundancy
- Cloud-based management

#### Makito (Haivision)

Makito provides enterprise broadcast encoders for high-reliability streaming.

| Product | Inputs | Outputs | Use Case |
|---------|--------|---------|----------|
| Makito X | Quad 4K60 SDI/HDMI | Multi-CDN, SRT | Premium streaming |
| Makito X4 | 4x 4Kp60 SDI | SRT, RTMP, RTSP | High-density encoding |

**Advantages:**
- Broadcast-grade reliability
- SRT protocol for low-latency streaming
- Multi-CDN support

---

### Intercom Ecosystems

#### Clear-Com

Clear-Com provides production intercom systems for esports broadcast coordination.

| Product | Type | Channels | Use Case |
|---------|------|----------|----------|
| MS-702 | Main station | 2 | Small production |
| MS-704 | Main station | 4 | Medium production |
| RS-701 | Beltpack | 1 | Shoutcaster/crew |
| FreeSpeak II | Wireless | 5 | Mobile production |

**Recommended Configuration:**
- MS-702 main station in control room
- RS-701 beltpacks for shoutcasters
- FreeSpeak II for roaming crew

#### Riedel Bolero

Riedel provides wireless intercom with Dante integration.

| Product | Type | Features | Use Case |
|---------|------|----------|----------|
| Bolero SW | Wireless beltpack | DECT, Dante | Premium wireless |
| Bolero CCP | Controller | 6 panels | Main station |
| Artist | Matrix | 1024x1024 | Large production |

**Advantages:**
- Dante audio integration
- High-density wireless
- Excellent audio quality

---

### Video Capture for Gaming

#### Magewell

Magewell provides NDI capture solutions for gaming PC video output.

| Product | Type | Inputs | Use Case |
|---------|------|--------|----------|
| EcoCapture Dual HDMI | PCIe card | 2x HDMI | Gaming PC NDI output |
| USB Capture HDMI 4K Plus | External | 1x HDMI 2.0 | Portable capture |
| Pro Capture Quad HDMI | PCIe card | 4x HDMI | Multi-station capture |

**Recommended for Esports:**
- EcoCapture Dual HDMI in each gaming PC
- Low-latency NDI output to production switcher
- Hardware encoding (minimal CPU impact)

#### AVerMedia

AVerMedia provides consumer and prosumer capture solutions.

| Product | Type | Resolution | Use Case |
|---------|------|------------|----------|
| Live Gamer 4K 2.1 | PCIe | 4K120 | Premium capture |
| Live Gamer Bolt | External | 4K60 | Thunderbolt capture |
| BU553 | USB | 4K30 | Portable capture |

---

### Gaming Monitor Ecosystems

Tournament-grade gaming monitors for competitive play and broadcast confidence.

#### ASUS ROG

| Product | Size | Resolution | Refresh | Use Case |
|---------|------|------------|---------|----------|
| PG27AQN | 27" | 1440p | 360Hz | Tournament play |
| PG248QP | 24" | 1080p | 540Hz | Competitive FPS |

#### BenQ Zowie

| Product | Size | Resolution | Refresh | Use Case |
|---------|------|------------|---------|----------|
| XL2566K | 24.5" | 1080p | 360Hz | Tournament standard |
| XL2546K | 24.5" | 1080p | 240Hz | Competitive play |

**Tournament Recommendation:** BenQ Zowie XL2566K for consistency with professional tournament standards.
