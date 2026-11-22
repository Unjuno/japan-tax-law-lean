### MachineryCostExcess1M.lean — 沖縄振興省令 art.4(1)(3)イ（百万円超）

Independent adversarial review. Frame: **H/T/D/C/U** (Hypothesis / Test / Decision / Competing reading / Uncertainty). All empirical work below is **独立再抽出** (fresh extraction from the pinned raw snapshot, not from the author's headers) followed by **照合** against the three Lean modules, the audit pin and INVENTORY.json. The heading reproduces the author's label verbatim; check 6 shows that label is wrong (the clause is ロ, not イ).

Scope of pins under review: law `414M60000008042`, revision `414M60000008042_20250401_507M60000008028`, raw `data/raw/414M60000008042_20250401_507M60000008028.law.json`, needle 「イに掲げるもののほか、機械及び装置で、これらの取得価額の合計額が百万円を超えるもの」, normative unit `NORM|c04fbcd7afdfbd2789ed292aed888fce9110f73ce74c9c5ced62c87e82924d41`.

---

#### Check 1 — raw SHA-256 (CRLF→LF) 照合

- **H（**refutable）: The impl header sha `5aca579dacd513116533f1a62abe88320dd4fdf5200b57d45973f41cd6fa1182` is the CRLF→LF-normalized SHA-256 of the pinned raw file, and the byte count is 83078.
- **T（**reproduction): `python <scratch script>` → `RAW_BYTES 83078`, `CRLF_COUNT 0`, `LF_BYTES 83078`, `SHA256_RAW 5aca579dacd513116533f1a62abe88320dd4fdf5200b57d45973f41cd6fa1182`, `SHA256_CRLF2LF 5aca579dacd513116533f1a62abe88320dd4fdf5200b57d45973f41cd6fa1182`, `MATCH_CRLF2LF True`, `MATCH_RAW True`. (File has no CRLF, so raw and normalized digests coincide.)
- **D（**decision): **PASS** — concrete value: 83078 bytes, sha256 `5aca579d…fa1182` = header = INVENTORY `raw_snapshot.source_sha256` (`5ACA579D…FA1182`, case-insensitive), `size_bytes 83078`. No mislabeled sha/size.
- **C（**competing): A CRLF-normalization bug or wrong revision could still yield equality by coincidence — implausible for 256-bit digest; INVENTORY cross-check removes it.
- **U（**uncertainty): None material. Hash is a byte-identity check, not legal correctness.

#### Check 2 — verbatim needle, whole-law uniqueness, title/status 照合

- **H（**refutable): The exact needle occurs exactly once in the whole law; `revision_info.law_title` equals INVENTORY `official_title`, and `current_revision_status` is `CurrentEnforced`.
- **T（**reproduction): `python <scratch script>` (recursive walk of every string leaf) → `NEEDLE_OCCURRENCES`/`EXACT_EQUAL_LEAF_COUNT 1`, leaf path `law_full_text/children[1]/children[2]/children[3]/children[2]/children[4]/children[3]/children[1]/children[0]/children[0]`. `python scripts/ci/transcription_audit.py` → `PASS 沖縄振興省令 art.4(1)(3)イ（機械装置取得価額百万円超）↔ MachineryCostExcess1M.lean …` and `transcription audit: 395/395 checks passed`. `revision_info/law_title = 沖縄振興特別措置法第九条等の地方税の課税免除又は不均一課税に伴う措置が適用される場合等を定める省令`; INVENTORY `/laws[210]/official_title` = same string; `current_revision_status = CurrentEnforced` in both; `current_revision.law_revision_id` = pinned revision.
  - Caution resolved: the law also contains near-duplicates e.g. 「…機械及び装置**並びに器具及び備品**で、…百万円を超えるもの」 and 「…機械及び装置で、…**五百万円**を超えるもの」. The pinned needle omits those, so uniqueness holds (exact count 1) and the audit cannot false-positive.
- **D（**decision): **PASS** — concrete value: 1 exact occurrence in whole law; title/revision/status all agree. (Label defect is separate — check 6.)
- **C（**competing): "verbatim-unique" might be defeated by the near-duplicates above — rejected: exact-string comparison gives 1.
- **U（**uncertainty): Audit output itself states "transcription fidelity only — NOT a semantics audit, NOT legal correctness".

#### Check 3 — source location (article / paragraph / item / subitem, main vs 附則)

- **H（**refutable): The needle sits in 第四条 (attr.Num=4), Paragraph#1, Item#3, Subitem1#2, inside `MainProvision` (not 附則 / a different article).
- **T（**reproduction): `python <scratch script>` ancestor chain of the unique match →
  `[01] tag=Law attr={LawType: MinisterialOrdinance}`, `[02] tag=LawBody`, `[03] tag=MainProvision`, `[04] tag=Article attr={'Num': '4'}`, `[05] tag=Paragraph attr={'Num': '1'}`, `[06] tag=Item attr={'Num': '3'}`, `[07] tag=Subitem1 attr={'Num': '2'}`, `[08] tag=Subitem1Sentence`, `[09] tag=Sentence attr={'Num': '1'}`. `ArticleTitle` leaf = `第四条`.
- **D（**decision): **PASS** for the structural coordinates (art 4 / para 1 / item 3 / subitem Num=2 / MainProvision). **FAIL** for the *kana label* — see check 6: Subitem1 Num=2 is ロ, not イ.
- **C（**competing): Could be in 附則 — rejected: chain contains `MainProvision`, no `SupplementaryProvision`.
- **U（**uncertainty): The e-Gov `Num` counter is correct (#2); only the author's kana gloss is wrong.

#### Check 4 — kanji 百万 = 1,000,000 via generate_verification_evidence.py

- **H（**refutable): `int_to_kanji(1_000_000) == "百万"` and `_kanji_int("百万") == 1_000_000`; spec literal `specCostFloor := 1_000_000` is auditable.
- **T（**reproduction): `python <scratch script>` importing `scripts/ci/generate_verification_evidence.py` → `int_to_kanji(1000000) = '百万'`, `_kanji_int('百万') = 1000000`, `roundtrip ok: True`. Spec line: `def specCostFloor : Nat := 1_000_000`.
- **D（**decision): **PASS** — concrete value: 百万 ⇔ 1,000,000, both directions; spec literal matches.
- **C（**competing): 百万 could mean 10^6 vs 10^8 (myriad nesting) — `_kanji_int` groups by 万/億 and confirms 10^6, not 10^8.
- **U（**uncertainty): Kanji→int is arithmetic, not a claim that 百万円 is the legally operative unit in context.

#### Check 5 — Lean triple: circularity, universality, examples, forbidden tokens

- **H（**refutable): Spec `spec*` defs reuse no impl names; the agreement theorem is universal (all Nat), ≥5 `example` decls and ≥3 genuine boundary categories exist; no `sorry`/`admit`/`axiom`/`Classical.choice`.
- **T（**reproduction): `python <scratch script>` comment-stripped token scan →
  - `MachineryCostExcess1M.lean`: examples 0, theorems 3, defs 2, no bad tokens.
  - `MachineryCostExcess1MSpec.lean`: examples 1, theorems 1, defs 3, no bad tokens; `specExceedsCost` def line `def specExceedsCost (total : Nat) : Bool := decide (Nat.succ specCostFloor <= total)`; `specCostFloor` def line `def specCostFloor : Nat := 1_000_000`. Impl names appear in the spec only inside the bridge theorem's `unfold` (1× `costFloor`, 2× `exceedsCostFloor`), never inside a `spec*` definition.
  - `MachineryCostExcess1MTests.lean`: examples 12, no bad tokens.
  - Universal theorem `agree_cost_floor (total : Nat) : exceedsCostFloor total = specExceedsCost total` proved with `by_cases` + `omega` — kernel-checked for every Nat, not a finite sample. (`specCostGrid` is explicitly labelled "finite … scaffolding"; it is not the proof.)
  - Boundary categories present: below floor (0, 1, 999,999), at floor (1,000,000 → false), first above (1,000,001 → true), plus `example (x : Nat)` applying the universal theorem.
- **D（**decision): **PASS** — concrete values: 13 `example` decls total (12 tests + 1 spec), 1 universal theorem, 3 boundary categories, 0 forbidden tokens. Strict semantics verified by reading: `exceedsCostFloor total := decide (costFloor < total)` with `costFloor = 1_000_000` ⇒ `exceedsCostFloor 1_000_000 = false`, `exceedsCostFloor 1_000_001 = true` (`floor_exclusive`, `first_above`). 超える is correctly exclusive — **no off-by-one, no 以上/以下 confusion**.
- **C（**competing): A circular spec that restates the impl would make agreement vacuous — rejected: different operators (`succ … <=` vs `<`), different constants, universal bridge. Note minor doc drift only: `docs/UNIT_MACHINERY_COST_EXCESS_1M.md` says "11 kernel-decided examples" but actual count is 12 in the Tests file (13 in the triple) — a documentation inaccuracy, not a correctness defect.
- **U（**uncertainty): `lake`/`lean` are **not on PATH** (`where lake`, `where lean`, `where elan` all fail; `lean-toolchain` = lean4:v4.35.0), so I could not run a fresh kernel compile; verification is by source reading plus comment-stripped static scan. Toolchain-enabled rebuild is recommended.

#### Check 6 — DEFECT: subitem label イ vs ロ (genuine concrete defect)

- **H（**refutable): The modeled clause 「…機械及び装置で、…百万円を超えるもの」 is subitem イ of 第四条(1)(3), as asserted in all three Lean headers, the audit pin label and the UNIT doc.
- **T（**reproduction): `python <scratch script>` listing siblings of `Article Num=4 / Paragraph Num=1 / Item Num=3` →
  `Subitem1 Num=1 : イ / 特別償却設備`
  `Subitem1 Num=2 : ロ / イに掲げるもののほか、機械及び装置で、これらの取得価額の合計額が百万円を超えるもの`
  Additionally the needle's own prefix 「イに掲げるもののほか」 = "other than those listed in イ", which cannot be the イ subitem itself.
- **D（**decision): **FAIL** — concrete value: the clause lives in **Subitem1 Num=2, kana ロ**, not イ. The impl header line 14 「第四条 … 第三号 (3), イ (subitem 2)」 is doubly wrong: イ is Num=1, and "イ (subitem 2)" is self-contradictory; correct is 「ロ (subitem 2)」. The mislabel propagates to: `MachineryCostExcess1M.lean` title/header lines 4, 14; `MachineryCostExcess1MSpec.lean` header line 10; `MachineryCostExcess1MTests.lean` header line 4; `transcription_audit.py` pin label line 3099; and `docs/UNIT_MACHINERY_COST_EXCESS_1M.md` (title, tables). The needle text, sha, revision, law id, article, paragraph, item and the numeric predicate are all correct — only the kana citation label is defective.
- **C（**competing): Perhaps "イ" was meant as the *referenced* category (the clause says "ほか イに掲げるもの"), not the containing subitem — rejected: that reading still cannot justify writing 「art.4(1)(3)イ（百万円超）」 as the location of the 百万円超 clause; the containing subitem is ロ, and the イ subitem ("特別償却設備") contains no cost condition at all. A reader following the pin to イ would find no such clause.
- **U（**uncertainty): This is a provenance/citation defect, **not** a numeric-semantics defect: `exceedsCostFloor` exactly matches the ロ clause (strict `>`, 1,000,000 false / 1,000,001 true). Legal characterisation of which subitem the exemption gate attaches to remains for human legal review.

**Concrete fix (for the author, not applied here):** relabel every occurrence of `art.4(1)(3)イ` / `第四条(1)(3)イ` / `イ (subitem 2)` in the three Lean headers, the `transcription_audit.py` pin label and the UNIT doc to `art.4(1)(3)ロ` / `第四条(1)(3)ロ` / `ロ (subitem 2)`; keep the verbatim needle, law id, revision, sha, article/paragraph/item/subitem-Num and all Lean definitions/theorems unchanged. Optionally also correct "11 kernel-decided examples" to 12.

---

### Verdict

**One concrete defect found: the subitem is mislabeled イ throughout; the pinned clause is actually 第四条(1)(3)ロ (Subitem1 Num=2).** Everything else 照合 cleanly: raw sha/bytes, whole-law verbatim uniqueness, article/paragraph/item/Num coordinates, main-provision location, INVENTORY title/status, 百万 ⇔ 1,000,000, spec non-circularity with a universal kernel-checked agreement theorem, 13 examples / 3 boundary categories, and zero `sorry`/`admit`/`axiom`/`Classical.choice`. In particular, 超える is modeled as strict `>` with the correct off-by-one behaviour (1,000,000 → false, 1,000,001 → true); no 以上/以下 error exists. The defect is a citation/label error, not an arithmetic one.

**No legal correctness is claimed by this review.** This is a computable slice of one CONDITION norm unit; the ロ/イ categorisation, the gated tax exemption/non-uniform taxation, the definition of 機械及び装置, other items/subitems and enforcement rules are not modelled, and **human legal review remains pending** (`LEGAL_REVIEW_PENDING`).
