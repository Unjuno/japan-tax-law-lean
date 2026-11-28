# Adversarial review — batch 218

Mechanical (not human) re-extraction and cross-check of
EastJapanQuakeKinshipDegreeThree against the pinned source. Reproducible from
committed bytes; NOT a human legal review. No approval field recorded; legal
review stays LEGAL_REVIEW_PENDING.

### EastJapanQuakeKinshipDegreeThree.lean — 東日本大震災特例法施行規則 第十五条 第二項 第四号 ロ

BY-DESIGN / 照合 (CI attestation + evidence wiring follow in separate commits).

- 一次資料: 東日本大震災の被災者等に係る国税関係法律の臨時特例に関する
  法律施行規則 (law 423M60000040020), revision
  423M60000040020_20260414_508M60000040039.
- Source: data/raw/423M60000040020_20260414_508M60000040039.law.json.
- 独立再抽出: walked `law_full_text` to the MAIN Article `Num=15`,
  `Paragraph#2`, `Item#4`, `Subitem1#2` (ロ); scoped article 2,029 chars.
  The needle occurs once in the scoped article and in the pinned raw.
  Sibling subitems イ / ハ / ニ are negative controls: イ contains an article
  label (第三十条) but neither 三親等 nor the needle; ハ / ニ likewise negative.
- 数値: 「三」 = 3 (`int_to_kanji(3) == '三'`, `kanji_variants(3) == {'三'}`,
  `matched_spellings({3}, needle) == {'3':['三']}`);
  `clause_correspondence` True. `三` is the substantive kinship degree, not an
  article id or fiscal-year label (the sibling イ label check confirms this).
- 計算: abstract kinship-graph degree with inclusive upper bound
  `withinThirdDegree d = d <= 3`. Kernel-decided: 0/1/2/3 true, 4 false.
- Distinct pattern: graph-distance degree bound; not an amount/rate/date gate.
- 独立仕様: specDegree/specWithin independent; agree* use `rw`/`rfl`.
- 判定 (H/T/D/C/U): H（滅失建物等所有者の三親等内の親族であることを証する書類）,
  T（3, 三, bytes pinned）, D（rfl / decide）, C（scoped needle 一意、sibling
  negative、inclusive boundary、spec 独立性）, U（戸籍謄本の定義、滅失建物等
  所有者の認定、イ/ハ/ニ、他項、実質的な親族法、他法・法的判定は非介入）。
- 本レビューは機械的であり、人間による法解釈・目視確認ではない
  (legal review remains LEGAL_REVIEW_PENDING)。
