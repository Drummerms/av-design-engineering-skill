# Esports Facility Design Patterns - Design Document

**Date:** 2026-03-01
**Author:** Michael Sablatura
**Status:** Approved

## Overview

Add comprehensive Esports Facility design patterns to `references/design-patterns.md` for Higher Education varsity competitive gaming programs. Patterns cover gaming stations, broadcast production, spectator experience, and facility infrastructure.

## Requirements

### Scope
- **Facility Type:** Full esports facility (gaming arena + broadcast + spectator)
- **Use Case:** Varsity/competitive focus with professional broadcast quality
- **Streaming:** Platform-agnostic (NDI/SDI output for any destination)

### Design Principles
1. **Low Latency:** All video/audio paths optimized for sub-frame delay
2. **Broadcast Quality:** 1080p60 minimum, 4K capability for main displays
3. **Scalability:** Patterns scale from 5-station studio to 40-station arena
4. **Platform Agnostic:** NDI/SDI infrastructure, encoding at final stage

## Content Structure

### 1. Esports Facility Architecture

Signal flow diagram showing:
- Gaming stations → Video capture → Production switcher
- Commentary positions → Audio mixer → Stream encoder
- Spectator displays → Distribution amplifiers
- Network architecture (gaming VLAN, broadcast VLAN, management VLAN)

### 2. Gaming Station Standards

Per-station requirements:
- Gaming PC with dual video output (game + facecam)
- 24-27" 144Hz+ gaming monitor
- Headset with mic and peripheral ports
- Network connection (dedicated gaming VLAN)
- Video capture for broadcast (NDI encoder or SDI)

Team row configuration (5-station pods):
- Standard 5v5 game format
- Shared network switch per pod
- Cable management troughs
- Coach position at row end

### 3. Broadcast/Streaming Production

Production hierarchy:
- **Production Switcher:** NDI-enabled (vMix, OBS, TriCaster, Blackmagic ATEM)
- **Audio Mixer:** Dante-enabled for commentary and game audio
- **Graphics/Replay:** Dedicated workstations with NDI output
- **Stream Encoders:** Hardware (Teradek, Makito) or software (OBS)

Shoutcaster desk:
- 2-4 commentary positions
- Individual monitors (game feed + program)
- Headset interconnection to broadcast audio
- Talkback/intercom integration

### 4. Spectator Experience

Display strategy:
- Main video wall (2x2 or 3x2 55" displays)
- Auxiliary displays for individual game feeds
- Scoreboard/graphics overlay position

Audio system:
- PA system for commentary and announcements
- Low-latency game audio feed for immersive experience
- Zone control for pre-event, match, intermission

### 5. Room Size Patterns

| Facility Type | Stations | Spectator Capacity | Control Room | Rack Count |
|---------------|----------|-------------------|--------------|------------|
| Small Studio | 5-10 | 0-30 | Optional | 1x 44RU |
| Competition Arena | 10-20 | 50-150 | Recommended | 2x 44RU |
| Large Arena | 20-40 | 150-500 | Required | Dedicated room |

### 6. Rack Elevation Examples

**Gaming Station Rack (per 10 stations):**
```
RU 44-42: Exhaust fans
RU 41-40: Netgear M4250-26G4XF-PoE+ (gaming VLAN)
RU 39-38: Netgear M4250-26G4XF-PoE+ (broadcast VLAN)
RU 37-36: Magewell EcoCapture (NDI encoders)
RU 35: Blank
RU 34: Q-SYS Core 110f (station audio)
RU 33: SurgeX SX-20
RU 32-1: Patch panels, cable management
```

**Broadcast Control Rack:**
```
RU 44-42: Exhaust fans
RU 41-40: Blackmagic ATEM Constellation 8K
RU 39-38: Blackmagic HyperDeck (recording)
RU 37: Blank
RU 36-35: Behringer X32 (broadcast audio)
RU 34-33: Dante AVIO adapters
RU 32-31: Netgear M4300-8X8F (fiber backbone)
RU 30-29: Streaming encoders (Teradek/Makito)
RU 28: SurgeX SX-AX20
RU 27-1: Intercom, graphics workstations, cable management
```

## Approved Manufacturers (Esports-Specific Additions)

| Category | Manufacturers |
|----------|---------------|
| Video Capture | Magewell, Blackmagic, AVerMedia |
| Production Switchers | Blackmagic, vMix, TriCaster, OBS |
| Gaming Monitors | ASUS ROG, BenQ Zowie, LG UltraGear |
| Streaming Encoders | Teradek, Makito, AWS Elemental |
| Intercom | Clear-Com, Riedel, Bolero |

## Implementation Notes

1. Add new section to `references/design-patterns.md` after existing content
2. Update SKILL.md trigger section to include esports keywords
3. Update assets/equipment-database.csv with esports-specific equipment
4. Maintain consistent formatting with existing patterns

## Files to Modify

- `references/design-patterns.md` - Add Esports Facility section (~200-300 lines)
- `SKILL.md` - Add esports trigger keywords
- `assets/equipment-database.csv` - Add esports equipment entries

## Success Criteria

- Patterns cover all three facility sizes (studio, arena, large)
- Signal flow diagrams use Mermaid format (consistent with existing)
- Equipment selections match approved manufacturers
- Rack elevations follow existing thermal/cable management standards
