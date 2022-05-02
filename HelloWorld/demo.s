.segment "HEADER"
    ; .byte "NES", $1A      ; iNES header identifier
    .byte $4E, $45, $53, $1A
    .byte 3                     ; 2x 16kb PRG code
    .byte 1                     ; 1x 8KB CHR data
    .byte $01, $00              ; mapper 0, vertical mirroring

.segment "VECTORS"
    ;; When an NMI happens (once per frame if enabled) the lable nmi:
    .addr nmi
    ;; When the processors first turns on or is reset, it will jump to the label reset:
    .addr reset
    ;; External interrupt IRQ (unused)
    .addr 0

; "nes" linker config requires a STARTUP section, even if it's empty
.segment "STARTUP"

; Main conde segment for the program
.segment "CODE"

reset:
    sei         ; 