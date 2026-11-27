# Adversarial review — batch 213

Mechanical (not human) re-extraction and cross-check of
ResidentCopyTwoMonthElapsed against the pinned source. Reproducible from
committed bytes; NOT a human legal review. No approval field recorded; legal
review stays LEGAL_REVIEW_PENDING.

### ResidentCopyTwoMonthElapsed.lean — 東日本大震災特例法施行規則 第三条の八 第二項 第二号 ロ(3)

BY-DESIGN / 照合 (CI attestation + evidence wiring follow in separate commits).

- 一次資料: 東日本大震災の被災者等に係る国税関係法律の臨時特例に関する
  法律施行規則 (law 423M60000040020), revision
  423M60000040020_20260414_508M60000040039.
- Source: data/raw/423M60000040020_20260414_508M60000040039.law.json.
- 独立再抽出: walked `law_full_text` to Article `Num=3_8`, `Paragraph#2`,
  `Item#2`, `Subitem1#1`, `Subitem2#3`; scoped article 2,563 chars. The full
  unit leaf and the long needle occur once each in that scoped article. The
  shorter substring 「二月を経過した日後に交付を受けたものに限る。」 recurs 4
  times in the article, so the long cell-unique needle was pinned instead.
- 数値: 「二」 = 2 (`int_to_kanji(2) == '二'`, `kanji_variants(2) == {'二'}`);
  `clause_correspondence({2}, text, …)` True. The `３` in `ロ（３）` is an item
  label, not a statutory numeral; 二 in 二月 is the sole substantive numeral.
- 計算: `qualified t i = t + 2 < i` (二月を経過した日「後」= strictly after).
  Kernel-decided: [3,5] false (ちょうど二月), [3,6] true, [3,7] true,
  [0,2] false, [0,3] true, [1,100] true. Sibling negative control
  `NORM|2fa9d54d…` (item 2(1)) lacks both the needle and the numeric clause.
- This is a one-sided unbounded strict-after month gate, distinct from the
  two-sided recency gates and the 15-day issuance deadlines already pinned.
- 独立仕様: specTwoMonths/specAfterTwoMonths independent; agree* use `rw`/`rfl`.
- 判定 (H/T/D/C/U): H（譲渡日から二月を経過した日後に交付された住民票の写し）,
  T（2, 二, bytes pinned）, D（rfl / decide）, C（cell-unique needle、sibling
  negative、strict-after 境界、spec 独立性）, U（代替書類、家屋居住不能時、
  2(1)/2(2)イ、Subitem2#4 と 4号の並行二月条項、暦計算、税の優遇、他条・
  法的効果は非介入）。
- 本レビューは機械的であり、人間による法解釈・目視確認ではない
  (legal review remains LEGAL_REVIEW_PENDING)。
