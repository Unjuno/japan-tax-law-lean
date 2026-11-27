# Adversarial review — batch 214

Mechanical (not human) re-extraction and cross-check of
PetroleumCoalSixMonthNoWithdrawalWindow against the pinned source. Reproducible
from committed bytes; NOT a human legal review. No approval field recorded;
legal review stays LEGAL_REVIEW_PENDING.

### PetroleumCoalSixMonthNoWithdrawalWindow.lean — 石油石炭税法施行令 第十六条 第二項 第八号

BY-DESIGN / 照合 (CI attestation + evidence wiring follow in separate commits).

- 一次資料: 石油石炭税法施行令 (law 353CO0000000132), revision
  353CO0000000132_20250401_507CO0000000006.
- Source: data/raw/353CO0000000132_20250401_507CO0000000006.law.json.
- 独立再抽出: walked `law_full_text` to Article `Num=16`, `Paragraph#2`,
  `Item#8`; scoped article 2,113 chars. The needle occurs once in the scoped
  article (and once verbatim in the pinned raw); sibling articles 13/15/17 and
  sibling item 7 are negative controls.
- 数値: 「六」 = 6 (`kanji_variants(6) == {'六'}`,
  `matched_spellings({6}, text) == {'6': ['六']}`);
  `clause_correspondence({6}, text, …)` True. Saturated subtraction is avoided:
  the caller establishes applicationMonth ≥ 1 and the window is an explicit
  six-consecutive-month predicate.
- 計算: `windowEnd a = a-1`; `inWindow a m = m <= E ∧ E < m + 6` (E-5..E).
  Kernel-decided: E=9 → m=4..9 true, m=3 false, m=10 false, m=0 false.
  `statementRequired a m w e = inWindow ∧ ¬w ∧ e`: excused no-withdrawal in
  window → true; withdrawn → false; unexcused → false; out-of-window → false.
- Adversarial note: an earlier draft asserted `inWindow 10 0 = true`; the Lean
  kernel rejected it (`decide` proved false), and the test/boundary theorem were
  corrected to `false`. This is a real counterexample caught by kernel checking,
  not a human review.
- 独立仕様: specSix/specPrevMonth/specInSixMonths/specMustState independent;
  agree* use `rw`/`rfl`.
- 判定 (H/T/D/C/U): H（前月末日以前六月内の検査を理由とする無引取り月の事実記載）,
  T（6, 六, bytes pinned）, D（rfl / decide）, C（scoped needle 一意、sibling
  negative、six-month 境界、kernel-rejected 反例、spec 独立性）, U（1項の適格性、
  2項の他12号、3〜8項、原油等の定義、数量・金額、7号の承認、13条、法的効果は
  非介入）。
- 本レビューは機械的であり、人間による法解釈・目視確認ではない
  (legal review remains LEGAL_REVIEW_PENDING)。
