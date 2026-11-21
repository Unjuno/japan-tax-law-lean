# Mechanically generated independent review — batch 26

### TwoThirdsMembershipThreshold.lean — 酒税の保全及び酒類業組合等に関する法律 第八十条

独立再抽出: a throwaway Python file written OUTSIDE the worktree
(D:\CodexData\Temp\_ttmc_verify.py, deleted afterwards) opened the pinned raw
JSON directly, hashed its bytes, walked law_full_text to select the single
Article attr.Num="80", and re-flattened / whitespace-normalised that scoped
article with its own code. No doc-comment, no transcription_audit.py and no
impl/spec/test file was trusted as input.

H/T/D/C/U record (CONFIRMED unless marked BY-DESIGN):

- H（pin/hash）: T（hashlib.sha256 on raw JSON bytes） → D（CONFIRMED: 0ef7ec85253d46a1c0fb505342fbf16e0b5a10b18fa0911766211b4ad1695699; 327,268 bytes; revision 328AC0000000007_20250601_504AC0000000068; law_id 328AC0000000007）.
- H（wrong article）: T（walk law_full_text, select Article attr.Num="80"） → D（CONFIRMED: exactly one Num=80 article among 178; 417 normalised chars）.
- H（needle wrong）: T（own norm count of the verbatim needle in the scoped article） → D（CONFIRMED: occurs 1x in scoped and 1x in full text; 「…酒類業組合の三分の二以上でなければ、設立することができない。」 present verbatim, with 「三分の二」 in scoped）.
- H（conversion wrong）: T（own reading: 三分の二 = 2/3, cross-multiply 3*members >= 2*qualified） → D（CONFIRMED: 2 = specNumer, 3 = specDenom; 以上 inclusive; no division/rounding）.
- H（formula wrong）: T（recompute the cross-multiplied grid from own constants） → D（CONFIRMED: (2,3) true, (1,3) false, (3,5) false 9<10, (3,4) true 9>=8, (0,3) false, (5,0) true, (0,0) true）.
- H（spec circular）: T（detector independent_spec_ok on spec vs impl def bodies） → D（CONFIRMED: True; impl def canEstablish absent from independent formulas; order reversed members*3 vs 3*members, bridged only by agreeTwoThirds/Nat.mul_comm）.
- H（boundary/decide）: T（detector boundary_evidence_categories on Tests） → D（CONFIRMED: {zero, small_input, saturation}; kernel-decided Nat/Bool examples）.
- H（scope）: T（compare scoped clause to modelled slice） → D（BY-DESIGN: 前三項の会員たる資格 definition, the 中央会 identity, other articles and all enforcement rules are out of scope per the header, not soundness defects）.

C（critical findings）: none.
U（unresolved scope）: as recorded under H（scope）above — BY-DESIGN.

判定: CONFIRMED / BY-DESIGN; 照合 against the pinned raw text passed on every H.
NOTE (MECHANICAL-NOT-HUMAN-REVIEW): this is a mechanical re-extraction and
arithmetic check, NOT a human legal review (LEGAL_REVIEW_PENDING).
