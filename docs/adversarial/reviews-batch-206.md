# Adversarial review — batch 206

Mechanical (not human) re-extraction and cross-check of
IssuanceDeadlineFifteenElapsedDays against the pinned source. Reproducible from
committed bytes; NOT a human legal review. No approval field recorded; legal
review stays LEGAL_REVIEW_PENDING.

### IssuanceDeadlineFifteenElapsedDays.lean — 関税暫定措置法施行令証明書発給省令 第二条 第四項

BY-DESIGN / 照合 (CI attestation + evidence wiring follow in separate commits).

- 一次資料: 関税暫定措置法施行令第二条第一項又は第二項の証明書の発給に関する省令
  (law 407M50000200018), revision 407M50000200018_20201221_502M60000200083.
- Source: data/raw/407M50000200018_20201221_502M60000200083.law.json.
- 独立再抽出: walked `law_full_text` to Article `Num=2`, `Paragraph#4`,
  `Sentence#1`; scoped article 326 chars. Needle
  「受理した日から起算して十五日を経過した日までに」 occurs once in scoped
  article; sibling article 1 (838 chars) lacks both the needle and the 十五
  spelling. Sibling article 3 is empty.
- 数値: 「十五」 = 15 (`matched_spellings({15}) == {'15':['十五']}`);
  `clause_correspondence({15}, …)` True on "spec numerals / rate ratio".
- 期限: 「経過した日までに」 is an EVENT-ANCHORED forward deadline:
  `issue ≤ accept + 15`. This is distinct from the already attested
  `CertificationIssuanceDeadlineFifteenDays` (「十五日以内」 relative duration
  `days ≤ 15`) for a different law; both are faithful to their own 原文 and are
  deliberately not merged.
- 境界: 14/15/16 days after acceptance kernel-decided; acceptance-day shifts
  (10 → 25/26) kernel-decided. Finite smoke checks; agreement is a separate rfl
  bridge.
- 独立仕様: specElapsed/specByDeadline use their own numerals and no impl
  identifiers; agree* are separate bridges (`rw`/`rfl`).
- 判定 (H/T/D/C/U): H（受理日から十五日経過日までに証明書を交付）, T（15, 十五,
  bytes pinned）, D（rfl / decide）, C（scoped needle 一意、sibling negative、
  elapsed-day 境界、spec 独立性）, U（1項の裁量・様式、2項の拒否通知、
  申請者・貨物の特定、受理の定義、暦計算、親法令 art.2(1)/(2)、他条は非介入）。
- 本レビューは機械的であり、人間による法解釈・目視確認ではない
  (legal review remains LEGAL_REVIEW_PENDING)。
