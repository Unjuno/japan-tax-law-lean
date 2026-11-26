# Adversarial review — batch 209

Mechanical (not human) re-extraction and cross-check of
OpinionApplicantDocumentWindowThreeMonths against the pinned source. Reproducible
from committed bytes; NOT a human legal review. No approval field recorded;
legal review stays LEGAL_REVIEW_PENDING.

### OpinionApplicantDocumentWindowThreeMonths.lean — 関税法意見申請手続規則 第二条 第三項 第一号

BY-DESIGN / 照合 (CI attestation + evidence wiring follow in separate commits).

- 一次資料: 関税法第六十九条の四第一項の規定による経済産業大臣に対する意見の
  求めに係る申請手続等に関する規則 (law 418M60000400006), revision
  418M60000400006_20201228_502M60000400092.
- Source: data/raw/418M60000400006_20201228_502M60000400092.law.json.
- 独立再抽出: walked `law_full_text` to Article `Num=2`, `Paragraph#3`,
  `Item#1`; scoped article 761 chars. Needle occurs once in scoped article
  and in none of the six sibling clauses of the same article.
- 数値: 「三」 = 3 (`matched_spellings({3}) == {'3':['三']}`);
  `clause_correspondence({3}, needle, …)` True with a substantive (v>1)
  spec literal, unlike 0/1-only units.
- 期限: bounded three-month lookback with inclusive upper bound:
  `c <= a ∧ a <= c+3`; future documents rejected; the 法人 branch is
  represented by the ¬individual shortcut (its own document rules out of scope).
  Kernel-decided boundaries: 0→2 true, 0→3 true, 0→4 false, 5→4 false,
  corporation shortcut true. Month ordinals only; calendar-day precision out
  of scope.
- 独立仕様: specWindow/specTimely are independent (`rw` bridge only).
- 判定 (H/T/D/C/U): H（個人の意見申請者は申請の日前三月以内作成書類を添付）,
  T（3, 三, bytes pinned）, D（rfl / decide）, C（scoped needle 一意、sibling
  negative、inclusive 境界、spec 独立性）, U（法人側の書類要件、1・2項、
  2号、別記様式、意見申請者の定義、行政手続全体、他条は非介入）。
- 本レビューは機械的であり、人間による法解釈・目視確認ではない
  (legal review remains LEGAL_REVIEW_PENDING)。
