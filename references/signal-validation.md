# Signal Validation Reference

This document provides complete signal compatibility rules and validation procedures for AV system design.

## Audio Signal Types

### Microphone Level
- **Voltage:** 1-10 mV (millivolts)
- **Connector:** XLR (3-pin)
- **Impedance:** 150-600 ohms (typical)
- **Max Distance:** 300 ft with balanced cable
- **Requirements:**
  - Preamplification required (40-60 dB gain typical)
  - Phantom power (48V) for condenser microphones
  - Direct connection to DSP mic input or external preamp

### Consumer Line Level
- **Voltage:** -10 dBV (316 mV)
- **Connector:** RCA, 3.5mm TRS
- **Impedance:** 10k ohms (typical)
- **Max Distance:** 15 ft (unbalanced)
- **Requirements:**
  - Unbalanced signal susceptible to noise
  - Use DI box or converter for professional equipment
  - Keep cable runs short

### Professional Line Level
- **Voltage:** +4 dBu (1.228V)
- **Connector:** XLR, 1/4" TRS
- **Impedance:** 600 ohms (nominal)
- **Max Distance:** 1000 ft with balanced cable
- **Requirements:**
  - Balanced signal rejects noise
  - Direct connection to professional equipment
  - Standard for all pro AV equipment

### Dante (Audio-over-IP)
- **Format:** Digital packetized audio
- **Connector:** RJ-45 (Ethernet)
- **Sample Rate:** 44.1 kHz, 48 kHz, 88.2 kHz, 96 kHz
- **Bit Depth:** 16, 24, or 32-bit
- **Max Distance:** 100 m (328 ft) per cable run
- **Requirements:**
  - Gigabit network infrastructure
  - Dante-enabled switch with QoS (DSCP)
  - IGMP snooping enabled
  - VLAN segregation recommended
  - Multicast or unicast routing

### AVB (Audio Video Bridging)
- **Format:** IEEE 802.1 Time-Sensitive Networking
- **Connector:** RJ-45 (Ethernet)
- **Max Distance:** 100 m per hop
- **Requirements:**
  - AVB-certified switches
  - Not directly compatible with Dante
  - Bridge required for Dante interoperability

## Video Signal Types

### HDMI
| Version | Bandwidth | Max Resolution | Features |
|---------|-----------|----------------|----------|
| 1.4 | 10.2 Gbps | 4K30 | 3D, ARC |
| 2.0 | 18 Gbps | 4K60 | HDR, HDCP 2.2 |
| 2.1 | 48 Gbps | 8K60, 4K120 | eARC, VRR, ALLM |

**Connector Types:**
- Type A (Standard): 13.9mm (most common)
- Type C (Mini): 10.42mm (portable devices)
- Type D (Micro): 6.4mm (mobile devices)

**Distance Limitations (passive cable):**
- HDMI 1.4: 50 ft (15m)
- HDMI 2.0: 25 ft (7.5m)
- HDMI 2.1: 10 ft (3m)

**For longer runs, use:**
- HDBaseT extenders (up to 100m)
- Fiber optic HDMI cables
- Active HDMI cables with embedded electronics

### HDBaseT
- **Bandwidth:** 10.2 Gbps (HDMI 1.4 equivalent)
- **Connector:** RJ-45 (CAT6A recommended)
- **Max Distance:** 100 m (328 ft)
- **Features:**
  - Carries video, audio, Ethernet, control, and power (POH)
  - 5Play: Video + Audio + Ethernet + Control + Power
  - Point-to-point or matrix switching

### DisplayPort
| Version | Bandwidth | Max Resolution |
|---------|-----------|----------------|
| 1.2 | 21.6 Gbps | 4K60 |
| 1.4 | 32.4 Gbps | 8K30, 4K120 |
| 2.0 | 80 Gbps | 16K60, 8K120 |

**Connector Types:**
- Standard DisplayPort
- Mini DisplayPort
- USB-C (DP Alt Mode)

### SDI (Serial Digital Interface)
| Standard | Bandwidth | Max Resolution | Distance |
|----------|-----------|----------------|----------|
| SD-SDI | 270 Mbps | 480i | 300 m |
| HD-SDI | 1.5 Gbps | 1080i60 | 200 m |
| 3G-SDI | 3 Gbps | 1080p60 | 150 m |
| 6G-SDI | 6 Gbps | 4K30 | 100 m |
| 12G-SDI | 12 Gbps | 4K60 | 80 m |

**Use Cases:**
- Broadcast environments
- Long cable runs without extenders
- Robust locking BNC connectors

### VGA
- **Format:** Analog RGBHV
- **Connector:** HD-15 (DE-15)
- **Max Resolution:** 2048x1536 @ 85 Hz (theoretical)
- **Max Distance:** 50 ft (higher resolutions shorter)
- **Legacy Support:**
  - No audio capability
  - Requires scaler for HDMI conversion
  - Include VGA-to-HDMI converter for modern systems

## Control Signal Types

### RS-232
- **Format:** Serial asynchronous
- **Connector:** DB-9 (9-pin D-sub)
- **Voltage:** ±12V (±3V minimum)
- **Max Distance:** 50 ft (15m) at 19.2 kbps
- **Protocol:** ASCII strings, manufacturer-specific
- **Use Cases:**
  - Display control (power, input, volume)
  - Projector control
  - Legacy device integration

### TCP/IP
- **Physical:** Ethernet (RJ-45)
- **Protocols:**
  - Telnet (port 23)
  - SSH (port 22)
  - REST API (HTTP/HTTPS)
  - WebSocket (full-duplex)
- **Max Distance:** 100 m per cable run
- **Advantages:**
  - Network-based control
  - Multiple controllers
  - Remote management

### PoE (Power over Ethernet)
| Standard | IEEE | Power | Voltage |
|----------|------|-------|---------|
| PoE | 802.3af | 15.4W | 44-57V |
| PoE+ | 802.3at | 30W | 50-57V |
| PoE++ | 802.3bt (Type 3) | 60W | 50-57V |
| PoE++ | 802.3bt (Type 4) | 90W | 52-57V |

**Power Budget Calculation:**
```
Total PoE Budget = Sum of all device power requirements
Required Switch Budget = Total Budget × 1.25 (25% headroom)
```

**Example:**
- 4 cameras at 15W = 60W
- 4 microphones at 12W = 48W
- Total = 108W
- Required switch budget = 135W minimum

### Relay Control
- **Type:** Dry contact closure
- **Connector:** Terminal block (screw or spring)
- **Voltage:** Isolated (no voltage on contacts)
- **Max Distance:** 500 ft with appropriate wire gauge
- **Use Cases:**
  - Screen up/down control
  - Lift control
  - Lighting relay triggering
  - Drapery control

### GPIO (Digital I/O)
- **Format:** Discrete high/low logic signals
- **Connector:** Terminal block, DB-25
- **Voltage:** 3.3V or 5V logic
- **Types:**
  - Input: Sensing contact closure or voltage
  - Output: Driving relays, indicators
- **Use Cases:**
  - Occupancy sensor integration
  - Contact closure sensing
  - LED indicator control
  - Interlock systems

### IR (Infrared)
- **Format:** Modulated infrared light
- **Emitter:** IR LED (940nm typical)
- **Receiver:** Photodiode/phototransistor
- **Range:** 30 ft line-of-sight
- **Protocol:** RC-5, RC-6, NEC, manufacturer-specific
- **Use Cases:**
  - Consumer device control
  - Set-top box control
  - Display control backup

### CEC (Consumer Electronics Control)
- **Physical:** HDMI cable (dedicated pin)
- **Protocol:** One-wire serial at 400 bps
- **Features:**
  - One remote control for multiple devices
  - Power synchronization
  - Input switching
- **Limitations:**
  - Inconsistent implementation
  - Not reliable for critical control
  - Use as backup to RS-232 or TCP/IP

## Power Signal Types

### AC Mains (US)
- **Voltage:** 120V RMS
- **Frequency:** 60 Hz
- **Connectors:**
  - NEMA 5-15R (15A standard outlet)
  - NEMA 5-20R (20A, T-slot)
  - NEMA L5-20R (20A locking)
  - NEMA L5-30R (30A locking)

### Power Distribution
- **Surge Protection:** Required for all electronic equipment
- **Power Conditioning:** Recommended for sensitive processors
- **UPS:** Required for control processors in critical applications
- **Power Sequencing:** Required when multiple amplifiers on same circuit

### Phantom Power
- **Voltage:** 48V DC (P48 standard)
- **Connector:** XLR (pins 2 and 3 relative to pin 1)
- **Current:** Up to 10 mA per microphone
- **Use Cases:**
  - Condenser microphones
  - Active DI boxes
- **Warning:** Do not apply to ribbon microphones

## Signal Bridging Matrix

When signals are incompatible, use these bridges:

| From | To | Bridge Required |
|------|-----|-----------------|
| Microphone | Professional Audio | Mic Preamp |
| Consumer Audio | Professional Audio | DI Box or Level Converter |
| Professional Audio | Consumer Audio | Attenuator (-10dB) |
| Dante | Analog XLR | Dante AVIO 2x2 |
| Analog XLR | Dante | Dante AVIO 2x2 |
| HDMI | HDBaseT | HDBaseT Transmitter |
| HDBaseT | HDMI | HDBaseT Receiver |
| DisplayPort | HDMI | Active DP-to-HDMI Adapter |
| VGA | HDMI | VGA-to-HDMI Scaler |
| HDMI | VGA | HDMI-to-VGA Converter |
| SDI | HDMI | SDI-to-HDMI Converter |
| HDMI | SDI | HDMI-to-SDI Converter |
| AVB | Dante | AVB-to-Dante Bridge |
| USB | Dante | Dante AVIO USB |

## Validation Checklist

For each device-to-device connection, verify:

1. **Signal Type Match:** Are output and input signal types compatible?
2. **Level Match:** Is signal level appropriate (mic/line/pro)?
3. **Connector Match:** Do physical connectors mate correctly?
4. **Distance:** Is cable run within maximum for signal type?
5. **Power:** Is adequate power available (PoE, DC, AC)?
6. **Bridge:** If incompatible, is appropriate bridge specified?
7. **Bandwidth:** For video, is bandwidth adequate for resolution?

## Common Mistakes to Avoid

1. **Connecting consumer output to professional input** - Will be too quiet
2. **Connecting professional output to consumer input** - Will be distorted
3. **Running HDMI more than 25ft passive** - Use HDBaseT extender
4. **Exceeding PoE switch budget** - Calculate all devices + 25%
5. **Mixing balanced and unbalanced without DI** - Ground loops, noise
6. **Forgetting phantom power for condensers** - No audio
7. **Assuming CEC is reliable** - Use RS-232 or TCP/IP for control
8. **VGA without audio path** - VGA carries video only
