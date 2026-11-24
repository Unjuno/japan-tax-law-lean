### BranchDeputyAppointment.lean — 国税不服審判所支部 第二条（財務省令指定＋各一人配置）

- 独立再抽出（一次資料 / independent re-extraction）: law id 345CO0000000050;
  revision 345CO0000000050_20010106_412CO0000000307;
  source data/raw/345CO0000000050_20010106_412CO0000000307.law.json;
  blob 5,950 bytes → SHA-256 independently recomputed
  `1084c2d40d7dd4535dfdd548819a261dfcf33d50952ab927b2b5db95345cc6da` (matches pin).
  JSON law_type CabinetOrder, law_title 国税不服審判所組織令,
  enforcement 2001-01-06; normative text is the pinned bytes.
- 照合（Article Num 2）: `tag=Article, attr.Num="2"` scoped article is 111 chars;
  needle found verbatim in that scoped article (Paragraph 1):
  「国税不服審判所の支部（以下「支部」という。）のうち財務省令で定めるものに、次席国税審判官各一人を置き、国税審判官をもつてこれに充てる。」
- Statutory literal: 一 → 1（各一人）; the transcribed literal set is {1};
  no 百分の rate in the clause, parse_statutory_rate = None,
  source_literals_verified({1}, scoped) = True. (The generator's spec_literals()
  filters 0/1 as structural, so its returned set is empty — the {1} check is
  applied directly to the independent spec's transcribed literal.)
- 判定: BY-DESIGN / CONFIRMED — DELEGATION (財務省令 designates which branches)
  COMBINED with a fixed per-branch count of one (各一人); total = designated
  branches × 1. The delegation is NOT modelled as a numeric threshold: it is a
  Bool flag (designationByOrdinance / specDelegated), not a count cutoff.
  Designation procedure, 国税審判官 appointment mechanics and other articles
  are out of scope.
- H/T/D/C/U: H（needle 一字一句 and SHA-256 independently re-extracted from 一次資料）,
  T（Article Num 2, 一 → 1 → specPerBranch = 1, 財務省令 → specDelegated = true）,
  D（specPerBranch/specDelegated/specDeputyCount contain no impl identifiers）,
  C（agreePerBranch/agreeDelegated/agreeDeputyCount are unfold + rfl bridges only）,
  U（zero 0, small_input 1/2/3, threshold_below 0, threshold_at 1, threshold_above 2, saturation）.
- Boundary evidence: 6 categories registered by
  generate_verification_evidence.boundary_evidence_categories(tests, {1}) — >= 3.
- 限定: 機械的独立クロスチェックであり人間の法律レビューではない (mechanical,
  not human, review). H/T/D/C/U is a machine-generated audit tuple, not a
  human sign-off; no lake/lean kernel re-run here — only detector computations
  plus Python-simulated kernel-decided Nat/Bool expectations were checked.
