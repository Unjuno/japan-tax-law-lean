# Mechanically generated independent review — batch 25

### PetroleumCoalFineRange.lean — 石油石炭税法 第二十三条

独立再抽出: a throwaway Python file written OUTSIDE the worktree
(D:\CodexData\Temp\_pcr_verify.py, deleted afterwards) opened the pinned raw
JSON directly, hashed its bytes, walked law_full_text to select the single
Article attr.Num="23", and re-flattened / whitespace-normalised that scoped
article with its own code. No doc-comment, no transcription_audit.py and no
impl/spec/test file was trusted as input.

H/T/D/C/U record (CONFIRMED unless marked BY-DESIGN):

- H（pin/hash）: T（hashlib.sha256 on raw JSON bytes） → D（CONFIRMED: b72f9fc1fde5b54cdb4862074330e7f2be99858780717f589e4932d1d115b625; 206,133 bytes; revision 353AC0000000025_20260525_506AC0000000052; law_id 353AC0000000025）.
- H（wrong article）: T（walk law_full_text, select Article attr.Num="23"） → D（CONFIRMED: exactly one Num=23 article among 89; 448 normalised chars）.
- H（needle wrong）: T（own norm count of the verbatim needle in the scoped article） → D（CONFIRMED: occurs 1x in scoped and 1x in full text; 「前項の犯罪に係る原油等に対する石油石炭税に相当する金額の三倍が五十万円を超える場合には、情状により、同項の罰金は、五十万円を超え当該石油石炭税に相当する金額の三倍以下とすることができる。」 present verbatim）.
- H（conversion wrong）: T（own kanji parser: 三→3, 五十万=50×10^4） → D（CONFIRMED: 三倍 = 3; 五十万円 = 500_000 = impl fineFloor = spec specFineFloor; 3 = spec specMultiplier）.
- H（formula wrong）: T（recompute 3*tax and the strict/inclusive grid from own constants） → D（CONFIRMED: tax=0→0 false, 1→3 false, 166_666→499_998 false, 166_667→500_001 true; fine=500_000 false 「超え」strict, 500_001 true, fine=500_001(=上限) true 「以下」inclusive, 500_002 false over-cap）.
- H（spec circular）: T（detector independent_spec_ok on spec vs impl def bodies） → D（CONFIRMED: True; impl defs fineUpper/fineFloor/rangeApplies/fineWithinRange absent from the spec formulas; the universal agree_range/agree_within theorems are the only bridge）.
- H（boundary/decide）: T（detector boundary_evidence_categories on Tests） → D（CONFIRMED: {zero, small_input, saturation}; kernel-decided Nat/Bool examples）.
- H（scope）: T（compare scoped clause to modelled slice） → D（BY-DESIGN: 情状により discretionary reduction, 犯罪成立要件, the 還付金/百万円 paragraph 2 and all other articles/procedures are out of scope per the header, not soundness defects）.

C（critical findings）: none.
U（unresolved scope）: as recorded under H（scope）above — BY-DESIGN.

判定: CONFIRMED / BY-DESIGN; 照合 against the pinned raw text passed on every H.
NOTE (MECHANICAL-NOT-HUMAN-REVIEW): this is a mechanical re-extraction and
arithmetic check, NOT a human legal review (LEGAL_REVIEW_PENDING).
