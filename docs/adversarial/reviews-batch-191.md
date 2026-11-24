### MergerMaxCapital.lean — 合併資本金額 第二条（被合併法人二以上の最大額選択）

- 独立再抽出（一次資料 / independent re-extraction）: law id 404CO0000000089;
  revision 404CO0000000089_20010106_412CO0000000307;
  source data/raw/404CO0000000089_20010106_412CO0000000307.law.json;
  SHA-256 e80aec82d08862cb6ae5611886e5d844624473d18936c6fd67ce9cc26ed68ab1
  (recomputed from the raw blob; matches the pin).
- 照合（Article Num 2）: needle found verbatim exactly once in the scoped
  第二条 text, 「合併により被合併法人の株主等に交付された合併後存続する法人の株式又は出資に係る資本の金額又は出資金額（被合併法人が二以上ある場合には、各被合併法人に係るこれらの金額のうち最も多い金額）」.
- Statutory literal: 二 → 2; spec_literals = {2}; parse_statutory_rate = None
  (no 百分の rate in the clause); source_literals_verified({2}, scoped) = True.
- 判定: BY-DESIGN / CONFIRMED — a MAX-SELECTION norm (select the largest of
  multiple merged corporations' capital amounts), with inclusive trigger 二以上
  (>= 2). Not a threshold, cap, or ratio; no merger procedure modelled.
- H/T/D/C/U: H（needle 一字一句 and SHA-256 re-extracted from 一次資料）,
  T（Article Num 2, 二 → 2 transcribed into specThreshold = 2）,
  D（independent spec* definitions carry no implementation identifiers）,
  C（unfold/rfl bridges for threshold, trigger and max selection）,
  U（zero, small_input, threshold_below=1, threshold_at=2, threshold_above=3）.
- Boundary evidence: >= 3 categories registered; 5 categories confirmed by
  generate_verification_evidence.boundary_evidence_categories(tests, {2}).
- Note: all checks here are mechanical (detector computations plus
  kernel-decided Nat/Bool examples), NOT human review. The H/T/D/C/U record is
  a machine-generated audit tuple, not a human sign-off.
