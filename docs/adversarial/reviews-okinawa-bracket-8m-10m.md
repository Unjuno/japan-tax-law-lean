### OkinawaArt19Bracket8M10M.lean — 沖縄特例政令 art.19(1)(3)（八百万円以上千万円未満）

Independent adversarial review — 独立再抽出 was performed directly from the pinned raw snapshot; every 照合 below is a re-executed empirical observation, not a restatement of a header. Record convention for every check: H/T/D/C/U, i.e. H（falsifiable hypothesis）, T（reproduction: actual command + observed output）, D（PASS/FAIL with a concrete observed value）, C（competing interpretation）, U（uncertainty / out-of-scope）.

Review target: worktree stated as 95bf29e plus the added triple. During this review the parent committed the work as `0a777b1 add_okinawa_bracket_8m_10m_unit`; the file digests in Check 5 pin exactly the bytes read. I wrote no repo file other than this review.

---

#### Check 1 — raw snapshot SHA-256 and byte count

H（The impl header hash `8c5521ff…a437` equals SHA-256 (CRLF→LF normalized) of `data/raw/347CO0000000151_20251231_507CO0000000426.law.json`.）

T（`python analyze.py`: read raw bytes; count CRLF; hash as-is and after `.replace(b"\r\n", b"\n")`. Observed: `raw bytes (as-is): 680296`, `CRLF count: 0`, `bytes after CRLF->LF: 680296`, `sha256 as-is = 8c5521ffb74068dc5b6872a3748b53a6eec38afc3637ece878eb0ca9da74a437`, `sha256 CRLF->LF = <same>`, both `MATCH = True`.）

D（PASS — 680,296 bytes; digest `8c5521ffb74068dc5b6872a3748b53a6eec38afc3637ece878eb0ca9da74a437` matches the impl header and `INVENTORY.raw_snapshot.source_sha256 = 8C5521FF…437`.）

C（Had the pin been computed only under pre-normalized bytes, a CRLF-bearing file would diverge; CRLF count is 0, so both conventions coincide here and cannot discriminate.）

U（Byte identity of the cached snapshot is confirmed, not that the cache is the authentic e-Gov response; the network source was not re-fetched.）

#### Check 2 — verbatim needle uniqueness, leaf text, title/revision consistency

H（「八百万円以上千万円未満の金額」 occurs exactly once in the whole law; `revision_info.law_title` equals the INVENTORY title and the revision/status fields agree.）

T（`python analyze.py`: `count in raw text: 1`; `string-leaf hits: 1`; leaf path `/law_full_text/children[1]/children[3]/children[1]/children[11]/children[2]/children[4]/children[2]/children[0]/children[4]/children[0]/children[0]/children[0]`; leaf repr `'八百万円以上千万円未満の金額'`. `revision_info`: `law_revision_id=347CO0000000151_20251231_507CO0000000426`, `law_type=CabinetOrder`, `law_title=沖縄の復帰に伴う国税関係法令の適用の特別措置等に関する政令`, `current_revision_status=CurrentEnforced`. INVENTORY `laws[133]`: `official_title` identical, `current_revision.law_revision_id` identical, `current_revision_status=CurrentEnforced`, `selection_status=current_enforced`.）

D（PASS — whole-law count 1; leaf text exact; titles and revision id equal; status `CurrentEnforced` in both sources.）

C（A same-text needle in 附則 would still give a whole-law count >1 or a second leaf; none exists, so "verbatim-unique" is genuine rather than scoped-only.）

U（Linguistic/legal reading of the clause is not established by a count; this is transcription fidelity only.）

#### Check 3 — real source location: main-provision Article 第十九条, not 附則 / duplicate article

H（The needle lies in Article `Num=19`, Paragraph `Num=1`, Item `Num=3`, inside `MainProvision`, and there is no other Article numbered 19 nor any 附則 on the path.）

T（`python path.py`/`attrs.py`: exact tag chain `Law → LawBody → MainProvision → Chapter → Article → Paragraph → Item → TableStruct → Table → TableRow → TableColumn → Sentence → STR`. `Chapter attr = {"Num": "2"}` (第二章 所得税), `Article attr = {"Num": "19"}`, `Paragraph attr = {"Num": "1"}`, `Item attr = {"Num": "3"}`, `ItemTitle三`. Whole-law scan of 216 Article nodes: `Article Num=19 count: 1`, at `/law_full_text/children[1]/children[3]/children[1]/children[11]`. `LawBody children[4..107]` are all `tag=SupplProvision`; none is on the needle chain. Article caption text: `ArticleCaption（予定納税額に関する経過措置）`, `ArticleTitle第十九条`.）

D（PASS — exactly one Article Num=19; it is under `MainProvision` (body child 3); needle is in Paragraph 1 / Item 3; no 附則 node on the path.）

C（The queue label `LawBody[3]/MainProvision/MainProvision[1]` is the queue's own naming: body child 3 is `MainProvision` and its child 1 is a `Chapter` (Num=2), not a second `MainProvision`. Loose label, but it resolves to the correct node.）

U（The article caption 「予定納税額に関する経過措置」 is a transitional-measures provision; whether a bracket table there is the intended legal target is a legal-interpretation question outside this audit.）

#### Check 4 — kanji numerals auditable from the clause

H（The repo's own statute-numeral functions map 8,000,000 ↔ 八百万 and 10,000,000 ↔ 千万, and both strings occur in the pinned clause.）

T（`python context.py` importing `scripts/ci/generate_verification_evidence.py`: `int_to_kanji(8000000) = '八百万'`; `int_to_kanji(10000000) = '千万'`; `_kanji_int('八百万') = 8000000`; `_kanji_int('千万') = 10000000`; `kanji_variants(8_000_000) = {'八百万'}`, `kanji_variants(10_000_000) = {'千万'}`; both substrings are present in the verbatim needle.）

D（PASS — both spec literals 8_000_000 and 10_000_000 round-trip to kanji forms that literally occur in 「八百万円以上千万円未満の金額」.）

C（`_kanji_int` on the whole clause raises `not a statute numeral: 円`; the literals must be isolated as numeral tokens, which is how the evidence generator uses them.）

U（The mapping is the repo's convention; an external Japanese-legal authority was not consulted.）

#### Check 5 — Lean module structure: circularity, universality, examples, forbidden constructs

H（The spec's `spec*` defs reuse no implementation definition; agreement is a universal kernel-checked theorem, not finite sampling; ≥5 examples, ≥3 boundary categories; no `sorry`/`admit`/`axiom`/`Classical.choice`.）

T（Read all three files. `Spec` defines `specLowerBound`, `specUpperBound`, `specInBracket := decide (¬ amount < specLowerBound && ¬ specUpperBound <= amount)` — its own literals and negated strict orders, no `lowerBound`/`upperBound`/`inBracket` inside any `spec*` def. `agree_bracket (amount : Nat) : inBracket amount = specInBracket amount` is proved by `by_cases`/`omega` for arbitrary `amount`. Tests: grep `^example` = 15 declarations; boundary points 0, 1, 7_999_999, 8_000_000, 9_999_999, 10_000_000. Grep for forbidden tokens in the three files matched only the comment line `No \`sorry\`, \`admit\`, \`axiom\` or \`Classical.choice\`.`. CRLF-normalized SHA-256: impl `e61420d9b1f284ecbf3f4c9cf06fb75b99fe6f04269b32d3a5587d5e952ee213` (2980 B); spec `0249e6b725cbb818e1712b3323e96eddaf5063ba800a7479626595263dfc7076` (2756 B); tests `d7f46ae9a49f9e4a2701e011ba5e3010c9cb097b2e54212b0efa7886ba2648b1` (1808 B). `python scripts/ci/transcription_audit.py` → `transcription audit: 237/237 checks passed`, including the new pin at line 237.）

D（PASS — no circular reuse; universal theorem present (∀ Nat, not a grid); 15 examples ≥ 5; zero and small-input(1) present, both bracket boundaries covered; no forbidden constructs in code. Minor doc drift: `docs/UNIT_OKINAWA_BRACKET_8M_10M.md` says "14 kernel-decided examples", actual `example` count is 15.）

C（The "saturation" category is only the trivial identity `8_000_000 + 0 = 8_000_000` plus the 10M rejection; it is weak as a distinct category but not a correctness gap. Kernel compilation was NOT independently reproduced: no `lake`/`lean` on PATH or in standard install locations, so the proofs were reviewed structurally, not recompiled here.）

U（Structural review + repo audit is not a substitute for a fresh `lake env lean` run; toolchain unavailability is environmental, not a finding against the module.）

#### Check 6 — exact operator semantics: 以上 inclusive, 未満 exclusive

H（`inBracket` encodes 8,000,000 <= amount AND amount < 10,000,000 with no off-by-one at either end.）

T（Impl lines 40–47: `lowerBound := 8_000_000`, `upperBound := 10_000_000`, `inBracket amount := decide (lowerBound <= amount && amount < upperBound)`. Theorems `lower_inclusive` (8M=true), `upper_exclusive` (10M=false), `just_below_upper` (9_999_999=true), `just_below_lower` (7_999_999=false). Spec equivalent form `¬ amount < 8M && ¬ 10M <= amount` = `amount >= 8M && amount < 10M`; `agree_bracket` is universal. Clause connective check: 以上 (inclusive `<=`) and 未満 (exclusive `<`) appear verbatim in the needle.）

D（PASS — lower inclusive, upper exclusive; 8M qualifies, 10M fails; 7_999_999 fails, 9_999_999 qualifies; impl and spec agree for all Nat.）

C（Mistaking 未満 for `<=` would wrongly admit exactly ¥10,000,000; mistaking 以上 for `<` would wrongly reject ¥8,000,000. Both wrong readings are refuted by named theorems and the universal agreement theorem.）

U（Whether adjacent rows (五百万円以上八百万円未満 / 千万円以上千五百万円未満) partition yen amounts without gaps is a legal-scope question; only this one cell is modelled, as declared.）

---

#### Finding F1 — header table-cell index is mislabeled (concrete, non-substantive)

H（The header annotation 「第六表cell」 correctly identifies the cell containing the needle.）

T（Impl header line 14: `Statutory article: 第十九条 (art. 19), 第一項 (1), 第三号 (3), 第六表cell`. `python cellindex.py`: `Needle table row count: 8`; needle at `row 5, flat cell 9` (upper 上欄 column). `python tableorder.py`: the needle's table is `#2` of 7 whole-law `TableStruct` nodes and the *only* table in Article 19.)

D（FAIL — under every natural enumeration the needle is row 5 of 8, flat cell 9 of 16, and whole-law table #2 — never 6. 「第六表cell」 is a concrete mislabel in header metadata.）

C（A visual 上欄/下欄 header row, present in e-Gov HTML but absent from the pinned JSON, would shift the count to row 6; the author's intent cannot be recovered from the artifact. The phrase is unique to this module, so it is not a shared-convention artifact.）

U（Metadata only: the verbatim clause, source path, revision and all Lean logic are unaffected. Suggested fix: replace 「第六表cell」 with 「第五行・上欄（フラット cell 9；全体で 2 番目の表）」 or delete the cell index.)

#### Finding F2 — new unit absent from machine-generated evidence ledger (process gap)

H（The new unit is registered in the machine-generated verification-evidence artifacts.）

T（`python evidence.py`: `verification_evidence.json` and `EVIDENCE_GENERATION_AUDIT.json` give 0 hits for `OkinawaArt19Bracket8M10M`, `efdfff…`, `八百万円以上千万円未満`, `347CO0000000151`. Repo-wide grep: the module name appears only in the 3 Lean files, the `transcription_audit.py` pin, the 3 imports in `JapanTaxLaw.lean`, and `docs/UNIT_OKINAWA_BRACKET_8M_10M.md`. `git show HEAD --stat`: the two data JSON files were regenerated (+169 / +1228 lines) for unrelated pre-existing modules, not for this unit.）

D（FAIL — no evidence-ledger entry or attestation reference for the new unit exists in either data JSON.）

C（May be intentionally deferred until the task queue / kernel attestation wiring is updated; this review file exists precisely to satisfy `generate_verification_evidence.py::review_ok`.）

U（Completion-gate coverage gap only; does not bear on transcription fidelity or Lean correctness. Suggested fix: register the unit in the task queue and regenerate evidence, or document the intentional exclusion.）

---

#### Verdict

Concrete defects found: YES, but both are non-substantive — F1 (a header 「第六表cell」 mislabel; actual row 5 / flat cell 9 / table #2) and F2 (the unit is not registered in the machine-generated evidence JSONs). No defect was found in the legal modelling itself: the verbatim clause, law id / article / revision / SHA-256, source path, 以上=inclusive and 未満=exclusive semantics, boundary arithmetic, spec independence and the universal agreement theorem all PASS the empirical checks above.

No legal correctness is claimed. This review establishes transcription fidelity and internal model consistency only; human legal review remains pending (LEGAL_REVIEW_PENDING). The substantive rate 百分の五十 that this bracket selects and the surrounding 政令 scheme are explicitly out of scope.
