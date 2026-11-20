# Mechanically generated independent review — batch 24

### CapitalFiveBillionThreshold.lean — 国税局課税部等の統括国税調査官等の所掌に属する事務の範囲を定める省令 第二条

独立再抽出: a throwaway Python file written OUTSIDE the worktree
(D:\CodexData\Temp\_cfb_verify.py, deleted afterwards) opened the pinned raw
JSON directly, hashed its bytes, walked law_full_text to select the single
Article attr.Num="2", and re-flattened / whitespace-normalised that scoped
article with its own code. No doc-comment, no transcription_audit.py and no
impl/spec/test file was trusted as input.

H/T/D/C/U record (CONFIRMED unless marked BY-DESIGN):

- H（pin/hash）: T（hashlib.sha256 on raw JSON bytes） → D（CONFIRMED: d626cf16d9fed1f7c4c51c463edd7e23b40bd66063cbbd79f3fe3055324610ed; 62,480 bytes; revision 352M50000040032_20220710_504M60000040044; law_id 352M50000040032）.
- H（wrong article）: T（walk law_full_text, select Article attr.Num="2"） → D（CONFIRMED: exactly one Num=2 article; 1,265 normalised chars）.
- H（needle wrong）: T（norm count of the verbatim needle in the scoped article） → D（CONFIRMED: occurs 1x; 「当該法人の資本金額又は出資金額が五十億円以上であること」 present verbatim）.
- H（floor wrong）: T（own kanji parser with 億=10^8: 五十 → 50, ×10^8） → D（CONFIRMED: 五十億 = 5_000_000_000 = impl capitalFloor = spec specCapitalFloor）.
- H（formula wrong）: T（recompute FLOOR <= amount on the boundary grid） → D（CONFIRMED: 0→false, 1→false, 4,999,999,999→false, 5,000,000,000→true, 5,000,000,001→true; 以上 inclusive）.
- H（spec circular）: T（detector independent_spec_ok on spec vs impl def bodies） → D（CONFIRMED: True; impl defs capitalFloor/atLeastCapitalFloor absent from the spec formula; the agreement theorem is the only bridge）.
- H（boundary/decide）: T（detector boundary_evidence_categories on Tests） → D（CONFIRMED: {zero, small_input, saturation}; 9 kernel-decided examples; Nat identity 5_000_000_000+0=5_000_000_000）.

C（critical findings）: none.
U（unresolved scope）: the remaining rows of the 第二条 table (1–7, 9, 10), the
二 paragraph, the official duties assigned, the other articles and all
enforcement rules are out of scope — BY-DESIGN per the implementation header,
not soundness defects.

判定: CONFIRMED / BY-DESIGN; 照合 against the pinned raw text passed on every H.
NOTE (MECHANICAL-NOT-HUMAN-REVIEW): this is a mechanical re-extraction and
arithmetic check, NOT a human legal review (LEGAL_REVIEW_PENDING).
