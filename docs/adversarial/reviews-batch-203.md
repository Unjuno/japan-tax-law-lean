### LocalCorpMaxCapital.lean — 法人臨時特別税政令 第二条（被合併法人二以上の最大額選択）

- 独立再抽出（一次資料 / independent re-extraction）: law id 403CO0000000035;
  revision 403CO0000000035_20010106_412CO0000000307;
  source data/raw/403CO0000000035_20010106_412CO0000000307.law.json;
  blob 44,540 bytes → SHA-256 independently recomputed
  `a0d48602a650d424251a63b1f4e312f3f0f5b5c3fd91b6adddf184ea04a6a06e` (matches pin).
  JSON re-read gives law_type CabinetOrder, law_title 法人臨時特別税に関する政令,
  enforcement 2001-01-06; the parent's 地方法人税法 label is a naming
  characterisation, not the pinned JSON title. Normative text is what is pinned.
- PARALLEL unit: identical needle to 法人税法 law 404CO0000000089 art. 2
  (MergerMaxCapital), but a DISTINCT law/revision → independent model + spec;
  no MergerMaxCapital import or identifier reuse.
- 照合（Article Num 2）: `tag=Article, attr.Num="2"` occurs exactly once,
  path `/Law/LawBody/MainProvision/Article`; needle found verbatim in that
  scoped article (Paragraph 2, item ロ):
  「合併により被合併法人の株主等に交付された合併後存続する法人の株式又は出資に係る資本の金額又は出資金額（被合併法人が二以上ある場合には、各被合併法人に係るこれらの金額のうち最も多い金額）」.
- Statutory literal: 二 → 2; spec_literals = {2}; no 百分の rate in the clause,
  parse_statutory_rate = None, source_literals_verified({2}, scoped) = True.
- 判定: BY-DESIGN / CONFIRMED — MAX-SELECTION with inclusive trigger 二以上
  (>= 2); not a threshold, cap or ratio. Merger procedure/stock delivery/
  基準法人 selection and other paragraphs are out of scope.
- H/T/D/C/U: H（needle 一字一句 and SHA-256 re-extracted from 一次資料）,
  T（Article Num 2, 二 → 2 → specThreshold = 2）,
  D（specThreshold/specMultiple/specMax contain no impl identifiers）,
  C（agreeThreshold/agreeMultiple/agreeMax are unfold + rfl bridges only）,
  U（zero, small_input, threshold_below=1, threshold_at=2, threshold_above=3）.
- Boundary evidence: 6 categories registered (zero, small_input, saturation,
  threshold_below, threshold_at, threshold_above) by
  generate_verification_evidence.boundary_evidence_categories(tests, {2}) — >= 3.
- 限定: 機械的独立クロスチェックであり人間の法律レビューではない (mechanical,
  not human, review). H/T/D/C/U is a machine-generated audit tuple, not a human
  sign-off; no lake/lean kernel re-run here — only detector computations plus
  Python-simulated kernel-decided Nat/Bool expectations were checked.
