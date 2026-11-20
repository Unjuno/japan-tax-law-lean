# Mechanically generated independent review — batch 22

### CombinedRegistrationRequest.lean — 昭和二十二年政令第百九号 第三条

独立再抽出: a throwaway Python file (deleted afterwards) opened
data/raw/322CO0000000109_19470627_000000000000000.law.json directly, hashed its
bytes, walked law_full_text to select Article attr.Num="3", and re-flattened /
whitespace-normalised that article. No doc-comment, no transcription_audit.py
and no impl/spec/test file was trusted as an input.

H/T/D/C/U record (CONFIRMED unless marked BY-DESIGN):

- H（pin/hash wrong）: T（hashlib.sha256 on raw JSON bytes vs INVENTORY raw_snapshot） → D（CONFIRMED: 9FF39F03E58B315D04FBB65246DD5A4E64CF8C6A428EAE84C53BB49C530816EC, 5406 bytes, source_file matches）.
- H（wrong article）: T（walk MainProvision, select Article attr.Num="3"） → D（CONFIRMED: exactly one Article Num=3, 90 normalised chars）.
- H（needle wrong）: T（norm(flat(article3)).count(needle_norm), verbatim substring check） → D（CONFIRMED: the full 原文 occurs 1x verbatim in the scoped article; 二箇以上 present）.
- H（threshold wrong）: T（decode 二箇 from the scoped clause） → D（CONFIRMED: 2; specMinProperties=2; impl uses 2 <= propertyCount; no other numeral modelled）.
- H（formula wrong）: T（recompute sameOffice && 2<=count） → D（CONFIRMED: T/0=false, T/1=false, T/2=true, T/3=true, T/100=true, F/0=false, F/2=false, F/5=false; reason/purpose intentionally not inputs）.
- H（spec circular）: T（read spec def bodies for impl identifiers） → D（CONFIRMED: specCanCombine is a structural match with its own constant; only agree* helpers mention impl）.
- H（boundary / decide unsound）: T（recompute Nat identity at threshold） → D（CONFIRMED: zero, small 1/2/3, different-office always false, specMinProperties-2=0）.

C（critical findings）: none.
U（unresolved scope）: 前二条 cases, 嘱託 procedure and registry-office
jurisdiction rules are out of scope — BY-DESIGN per the implementation header,
not soundness defects.

判定: CONFIRMED / BY-DESIGN; 照合 against the pinned raw text passed on every H.
NOTE (MECHANICAL-NOT-HUMAN-REVIEW): this is a mechanical re-extraction and
arithmetic check, NOT a human legal review (LEGAL_REVIEW_PENDING).
