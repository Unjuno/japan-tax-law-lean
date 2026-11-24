# Adversarial review — 地方税法 art. 30 罰金上限 三十万円

Unit: `NORM|78c4b66be4df3492b588b23896bb80a6c620035b38cf0677804af0bc7f039118`
Verbatim: 「…その違反行為をした者は、三十万円以下の罰金に処する。」

- **H**: the cap could be exclusive (「以下」 misread as strict), or the amount
  mis-scaled to 3,000,000; or the violation conditions silently assumed true.
- **T**: re-extract art. 30; parse 三十万円 → 300,000 (auditor D=PASS);
  inspect `withinCap` with inclusive `<=`; kernel boundaries 299,999 /
  300,000 / 300,001; `#print axioms`.
- **D**: verbatim located; only numeric constant in this unit is 300,000 and it
  appears in spec and impl. The cap is inclusive, matching 「以下」. The
  violation (虚偽の申告 etc.) is caller-established and NOT modelled; the
  cross-reference to 前条第一項 is out of scope. `at_cap` / `above_cap` are
  axiom-free; `agree_spec_impl` uses standard `propext`.
- **C**: an exclusive reading is recorded as a competing interpretation.
- **U**: whether a violation occurred and human legal review pending.
