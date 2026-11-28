# Adversarial review — batch 220

Mechanical (not human) re-extraction and cross-check of
CertificateIssueWithinFifteenDaysFromAcceptance against the pinned source.
Reproducible from committed bytes; NOT a human legal review. No approval field
recorded; legal review stays LEGAL_REVIEW_PENDING.

### CertificateIssueWithinFifteenDaysFromAcceptance.lean — 電解二酸化マンガン証明書発給省令 第二条 第四項

BY-DESIGN / 照合 (CI attestation + evidence wiring follow in separate commits).

- 一次資料: 電解二酸化マンガンに対して課する不当廉売関税に関する政令
  第一条第一項第一号に規定する電気分解の工程を経て製造した二酸化マンガン
  でない旨の証明書の発給に関する省令 (law 420M60000400040), revision
  420M60000400040_20240301_506M60000400008.
- Source: data/raw/420M60000400040_20240301_506M60000400008.law.json.
- 独立再抽出: walked `law_full_text` to the MAIN Article `Num=2`,
  `Paragraph#4`; scoped article 395 chars; needle occurs once. Sibling
  paragraph-1/2 sentences are negative controls (no needle, no 十五).
- 数値: 「十五」 = 15 (`matched_spellings({15}, text) == {'15':['十五']}`;
  `kanji_variants(15) == {'十五','一・五'}` but only 十五 occurs verbatim);
  `clause_correspondence` True.
- 計算: `within15 a i = a <= i && i - a <= 15`. Kernel-decided: (0,0) true,
  (0,15) true, (0,16) false, (10,25) true, (10,26) false, and the critical
  pre-acceptance guard (10,9) false — without the guard, Nat saturation would
  wrongly accept issuance before acceptance.
- Adversarial note: the kernel rejected a draft that treated (10,25) as false
  and (10,26) as true (off-by-one at the inclusive boundary). Both impl and
  tests were corrected. This is a real counterexample caught by kernel checking.
- Caveat recorded: the 15-day deadline family overlaps older modules
  (`CertificationIssuanceDeadlineFifteenDays`, `IssuanceDeadlineFifteenElapsedDays`);
  this is a distinct law/revision/cell pin with the explicit guard, not a
  novelty claim.
- 独立仕様: specLimit/specWithin independent; agree* use `rw`/`rfl`.
- 判定 (H/T/D/C/U): H（申請受理日から十五日以内の証明書交付）, T（15, 十五,
  bytes pinned）, D（rfl / decide）, C（scoped needle 一意、sibling negative、
  inclusive 境界、受理前ガード、kernel-rejected 反例、spec 独立性）, U（初日
  不算入、暦・閏・休日、延長、1項の実質認定、2〜3項、附則2条、他法は非介入）。
- 本レビューは機械的であり、人間による法解釈・目視確認ではない
  (legal review remains LEGAL_REVIEW_PENDING)。
