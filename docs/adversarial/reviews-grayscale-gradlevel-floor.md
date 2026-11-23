# 独立再抽出 照合 — adversarial review (read-only research)

### GrayscaleGradationFloor.lean — 情報通信技術活用省令 art.5(2)(2)（二百五十六階調以上）
照合 (comparison against the pinned primary artifact, an independently formulated spec, and fresh Python/grep runs). Every check below records an actual command/output and a PASS/FAIL decision. Machine-checked record token: **H/T/D/C/U**. Every result was independently re-extracted (独立再抽出) from the pinned snapshot; no impl header, docstring, unit doc or author note was trusted as evidence. The reviewer wrote only this file (helper scripts were placed outside the worktree). Normative unit label under review: `NORM|d74340473e54a94163ee5d61d028c0fa4379a44d178ca21a314441520806eaf6`.

H（Falsifiable hypothesis, Check 1）: the impl header `sha256: ee7ca0224460193ba599803eb2267eabf81eb00a30f36d5905cbb4cd355f9975` is the genuine SHA-256 of `data/raw/415M60000040071_20260924_506M60000040031.law.json` after CRLF→LF normalization at the claimed size.
T（Reproduction, Check 1）: fresh `python D:\CodexData\Temp\opencode\grayscale_verify.py` — `size_bytes = 104184`, `crlf_count = 0`, `lf_count = 0`, `size_bytes_lf = 104184`, `sha256_raw = sha256_crlf_to_lf = ee7ca0224460193ba599803eb2267eabf81eb00a30f36d5905cbb4cd355f9975`, `header_impl = <same>`, `sha_match_raw = sha_match_lf = True`.
D（Decision, Check 1）: **PASS**. Concrete value: 104,184 bytes; CRLF count 0 (snapshot is already LF-only, so CRLF→LF is a no-op); raw hash == normalized hash == impl header hex-for-hex, and equals INVENTORY `source_sha256 = EE7CA022...F9975` (case-insensitive) with the same `size_bytes = 104184` and `source_file`.
C（Competing interpretation, Check 1）: the header hash could have been copied from a sibling snapshot — rejected: recomputation reads the exact pinned filename's bytes independently, and three anchors (impl header, recomputed hash, INVENTORY metadata) agree. No CRLF-hash divergence exists.
U（Uncertainty, Check 1）: hash proves byte identity of the *local* snapshot only. The live e-Gov endpoint was not re-fetched; that is provenance/integration, not a kernel or legal-correctness matter.

---

## Check 2 — verbatim needle, whole-law count, law title / status

H（Falsifiable hypothesis）: the needle 「白色から黒色までの階調が二百五十六階調以上であること。」 occurs exactly once in the WHOLE law, and `revision_info.law_title` matches INVENTORY `official_title` with `current_revision_status = CurrentEnforced`.

T（Reproduction）: independent recursive JSON walk + `str.count` over decoded text and over a standalone-string scan:

```
needle_in_raw_text_count = 1
needle_in_lf_text_count = 1
exact_standalone_string_matches = 1   # $.law_full_text.children[1].children[3]...Sentence[1].children[0].children[0]
revision_info.law_title = 国税関係法令に係る情報通信技術を活用した行政の推進等に関する省令
revision_info.current_revision_status = CurrentEnforced
revision_info.law_revision_id = 415M60000040071_20260924_506M60000040031
revision_info.repeal_status = None
revision_info.law_type = MinisterialOrdinance
law_info.law_id = 415M60000040071
INVENTORY index = 216
INVENTORY.official_title = 国税関係法令に係る情報通信技術を活用した行政の推進等に関する省令
INVENTORY.raw_snapshot.source_sha256 = EE7CA0224460193BA599803EB2267EABF81EB00A30F36D5905CBB4CD355F9975
```

D（Decision）: **PASS**. Concrete values: needle count = 1 (not 0, not 2) in the whole law, both in raw decoded text and as a single parsed string leaf; titles are identical strings; `law_id`, `law_revision_id`, `law_type = MinisterialOrdinance`, `repeal_status = None` and `current_revision_status = CurrentEnforced` agree between `revision_info`, `law_info` and INVENTORY.

C（Competing interpretation）: (a) the needle might also appear in 附則 or a metadata field — excluded by the whole-file `str.count = 1` and the single leaf hit. (b) My first walker printed `structural_leaf_hits = 0`; this was a bug in my walker (it ignored string children of a list), not a source anomaly — re-walking every string value found exactly one leaf, independently confirmed by raw-text count = 1. (c) This could be the parent Act (法律) rather than its 省令 — excluded by `law_type = MinisterialOrdinance` and the full title in both artifacts.

U（Uncertainty/out-of-scope）: INVENTORY is repository metadata; no external registry re-verification was performed. The `CONDITION` characterization is a modelling claim, not a legal conclusion.

---

## Check 3 — source location: Article 第五条, Paragraph 2, Item 2, MAIN provision

H（Falsifiable hypothesis）: the unique needle sits in Article `attr.Num=5`, Paragraph `Num=2`, Item `Num=2`, inside `MainProvision` (not 附則), as the header claims.

T（Reproduction）: full independent chain from `law_full_text` to the leaf (`python D:\CodexData\Temp\opencode\grayscale_walk.py`):

```
Law[Num=071] / LawBody / MainProvision / Chapter[Num=2] / Article[Num=5] /
Paragraph[Num=2] / Item[Num=2] / ItemSentence / Sentence[Num=1]
LEAF: 白色から黒色までの階調が二百五十六階調以上であること。
Article_tag_count_whole_law = 29
SupplProvision_tag_count = 35
MainProvision_tag_count = 1
LawBody_child_tags = LawTitle(0), EnactStatement(1), TOC(2), MainProvision(3), SupplProvision(4..)
```

D（Decision）: **PASS**. Concrete values: the needle leaf resolves under `MainProvision → Chapter[Num=2] → Article[Num=5] → Paragraph[Num=2] → Item[Num=2] → ItemSentence → Sentence[Num=1]`. This corroborates the header's 「第五条(5)、第二項(2)、第二号(2)」 from JSON `Num` attributes, not caption strings. There is exactly one MainProvision, and the needle is in it, not in 附則.

C（Competing interpretation）: a same-numbered 附則 trap was actively sought — 29 `Article` nodes and 35 `SupplProvision` nodes exist, but the unique needle leaf is in the single MainProvision Article 5. The header path notation `LawBody[3]/MainProvision/MainProvision[1]/Article:5/Article#5/...` is a confusing transcription that also omits `Chapter[Num=2]`; it is cosmetic, not a mislabel of law/article/revision.

U（Uncertainty/out-of-scope）: only this revision's snapshot was scanned. Which legal consequence this CONDITION gates is caller-established; not decided here.

---

## Check 4 — kanji 二百五十六 = 256, spec literal auditable

H（Falsifiable hypothesis）: `generate_verification_evidence.py`'s `int_to_kanji` / `_kanji_int` map 二百五十六 ⇄ 256, so the impl/spec literal `256` is auditable from the clause.

T（Reproduction）: importlib load of `scripts/ci/generate_verification_evidence.py`:

```
int_to_kanji(256) = 二百五十六
_kanji_int('二百五十六') = 256
int_to_kanji(256) in needle = True
int_to_kanji(255) = 二百五十五
int_to_kanji(257) = 二百五十七
```

D（Decision）: **PASS**. Concrete values: `int_to_kanji(256)` round-trips to `_kanji_int(...) = 256`, and that exact spelling occurs in the needle. Both `gradationFloor : Nat := 256` and `specFloor : Nat := 256` are therefore anchored to the clause by an independent parser, not merely asserted.

C（Competing interpretation）: 二百五十六 could be a mis-transcription of 二百五十 / 六百五十 — excluded by the exact roundtrip and the literal presence of 二百五十六 in the needle. 255 and 257 parse to distinct strings, so the boundary literal is not confused with its neighbours.

U（Uncertainty/out-of-scope）: the physical meaning of 階調 and the Nat domain (whole level counts) are declared modelling choices; fractional gradation measurement is not modelled.

---

## Check 5 — circularity, universal kernel-checked agreement, examples, forbidden tokens

H（Falsifiable hypothesis）: the `spec*` defs reuse no impl name, the agreement theorem is universal over all Nat (not sampling), there are ≥5 `example` decls and ≥3 genuine boundary categories, and no `sorry`/`admit`/`axiom`/`Classical.choice` appears in executable code.

T（Reproduction）: read all three modules; `generate_verification_evidence.strip_comments` before scanning:

```
GrayscaleGradationFloor.lean    examples_in_code = 0  forbidden = []
GrayscaleGradationFloorSpec.lean examples_in_code = 2  forbidden = []
GrayscaleGradationFloorTests.lean examples_in_code = 12 forbidden = []
total examples = 14
impl names in spec* def bodies = []  (impl names appear only in bridge theorem)
```

Spec-local defs: `specFloor : Nat := 256`; `specMeetsGrayscale levels := decide (¬ levels < specFloor)`; `specGrayscaleGrid` uses only `specFloor` / `specMeetsGrayscale`. The impl names `gradationFloor` / `meetsGrayscaleFloor` appear in the spec file only inside the bridge theorem `agree_grayscale_floor` (line 37), never inside a `spec*` def body. The bridge is:

```
theorem agree_grayscale_floor (levels : Nat) :
    meetsGrayscaleFloor levels = specMeetsGrayscale levels := by
  unfold meetsGrayscaleFloor gradationFloor specMeetsGrayscale specFloor
  by_cases h : 256 <= levels
  · have hn : ¬ levels < 256 := by omega
    simp [h, hn]
  · have hn : levels < 256 := by omega
    simp [h, hn]
```

D（Decision）: **PASS**. Concrete values: 14 `example` decls (≥5); boundary categories {zero: 0, small_input: 1, just_below: 255, at_floor: 256, above: 257} — 5 genuine categories (≥3); zero forbidden tokens in code. The agreement is a `theorem` quantified over every `Nat` and discharged by `omega` plus `simp`, i.e. kernel-checked for all levels, not a finite grid sample; `specGrayscaleGrid` is explicitly Bool scaffolding with the universal theorem as the proof.

C（Competing interpretation）: both constants are hard-coded to 256, which could be called circular — rejected: the statutory constant is a shared primary-source fact (Check 4), while the operators genuinely differ (`levels >= 256` via `<=` versus `¬ levels < 256` via `<`), and the bridge is a kernel-checked ∀ theorem, not an axiom, `Classical.choice` or a sampling grid. A spec that merely restated the impl predicate would have failed this check; this one does not.

U（Uncertainty/out-of-scope）: no Lean toolchain is on PATH in this environment (`lean`/`lake`/`elan` all resolve to None; only `lean-toolchain` file pins `leanprover/lean4:v4.35.0`), so an independent kernel compile was NOT run here. The kernel-attestation is structural reading of the three modules plus the observed `by omega`/`simp` proof shape. `lake build` was intentionally not run to respect the one-file write restriction.

---

## Check 6 — 以上 inclusive, off-by-one at 256

H（Falsifiable hypothesis）: 以上 is inclusive: `meetsGrayscaleFloor 256 = true` and `meetsGrayscaleFloor 255 = false`; the predicate is not 未満 (`<`) or 超える (`>`).

T（Reproduction）: impl theorems `floor_inclusive`, `just_below`, `zero_false`; tests examples at 0→false, 1→false, 255→false, 256→true, 257→true; impl/spec agreement at 0, 255, 256 and for arbitrary `x`:

```
example : meetsGrayscaleFloor 255 = false := by decide
example : meetsGrayscaleFloor 256 = true  := by decide
example : meetsGrayscaleFloor 257 = true  := by decide
example (x : Nat) : meetsGrayscaleFloor x = specMeetsGrayscale x := agree_grayscale_floor x
```

D（Decision）: **PASS**. Concrete values: 255→false, 256→true, 257→true; no off-by-one. `meetsGrayscaleFloor levels = decide (256 <= levels)` is inclusive `>=`, and `specMeetsGrayscale = decide (¬ levels < 256)` is provably equivalent for every Nat. All three modules explicitly scope the model to this one numeric condition and declare 白色/黒色 definitions, gated imaging/record-keeping requirements and other items/paragraphs caller-established.

C（Competing interpretation）: 未満 (strict `<`) would wrongly reject exactly 256, and 超える (`>`) would invert the predicate — both excluded by the needle wording 「二百五十六階調以上」 and by `floor_inclusive`. Conversely, reading the unit as modelling the full imaging requirement would be an over-claim — excluded by the explicit scope disclaimers.

U（Uncertainty/out-of-scope）: the gated imaging/record-keeping requirements, 白色/黒色 definitions, other items and enforcement rules are deliberately not modelled. Human legal review pending.

---

## Check 7 — audit pin, three imports, norm-id wiring

H（Falsifiable hypothesis）: the `transcription_audit.py` pin, the three `JapanTaxLaw.lean` imports and the claimed norm id are correctly wired, and the audit passes with this pin.

T（Reproduction）: `grep GrayscaleGradationFloor` → pin at `scripts/ci/transcription_audit.py:3477-3481` (law `415M60000040071`, scope `article`, `第五条`, needle verbatim); `JapanTaxLaw.lean:1857-1859` imports all three modules. Fresh read-only audit run (`python scripts/ci/transcription_audit.py`, stdout captured outside the repo, no repo writes):

```
exit = 0
PASS  情報通信技術活用省令 art.5(2)(2)（二百五十六階調以上）↔ GrayscaleGradationFloor.lean (floor 256, 以上 inclusive)
transcription audit: 456/456 checks passed
```

D（Decision）: **PASS**. Concrete values: pin law/scope/article/needle match the source JSON; three imports present; audit exit 0 with 456/456 checks passed and the named pin passing.

C（Competing interpretation）: an initially empty `findstr` on audit stdout was a shell/Japanese-encoding artifact — re-checked by reading the captured UTF-8 output: pin present and passing. The norm id `NORM|d7434047…eaf6` appears only as a label in the impl header, spec header and unit doc (3 occurrences), not in any generated evidence ledger — a wiring/integration observation, not a contradiction.

U（Uncertainty/out-of-scope）: whether the norm id is materialized into CI evidence depends on regeneration of generated JSON artifacts (no occurrence in `data/`), which this read-only review did not perform.

---

## Check 8 — author unit-doc example count (concrete, documentation-only finding)

H（Falsifiable hypothesis）: `docs/UNIT_GRAYSCALE_GRADATION_FLOOR.md` line 28 claim "Tests: 11 kernel-decided examples; boundary categories {zero, small_input, saturation}" is accurate.

T（Reproduction）: counted `^example` lines after comment stripping and read the tests file directly:

```
GrayscaleGradationFloorTests.lean examples = 12  (lines 14,17,18,21,24,27,30,33,34,35,38,41)
GrayscaleGradationFloorSpec.lean  examples = 2   (lines 46,54)
total = 14
doc line 28 says 11
doc boundary set = {zero, small_input, saturation}; actual = 5 categories (incl. just_below, at_floor, above)
```

D（Decision）: **FAIL (documentation only; no code/legal defect)**. Concrete value: 12 `example` decls in Tests (not 11), 14 across the triple. The requirement of ≥5 examples is still comfortably met; the boundary set in the doc is also incompletely worded versus the five actual categories, but the tests themselves cover all five. This is a miscount in the author's doc, not a flaw in the Lean modules or the source transcription.

C（Competing interpretation）: one could read "11 kernel-decided" as excluding the `rfl` decls (lines 14 and 41) — that would give 10, not 11, so even that charitable reading does not match; the doc figure is simply off.

U（Uncertainty/out-of-scope）: concrete fix — change line 28 of `docs/UNIT_GRAYSCALE_GRADATION_FLOOR.md` to "Tests: 12 kernel-decided `example` decls in GrayscaleGradationFloorTests plus 2 in GrayscaleGradationFloorSpec (14 total); boundary categories {zero, small_input, just_below, at_floor, above}". No Lean file needs editing. (This finding is recorded here only; the reviewer did not modify the doc under the one-file-write restriction.)

---

## Verdict

**No concrete legal-correctness or kernel defect found** in the new module triple. Eight empirical checks were performed (独立再抽出 / 照合): byte-exact 104,184-byte snapshot with matching SHA-256; a whole-law-unique verbatim needle resolved to `MainProvision → Chapter[Num=2] → Article[Num=5] → Paragraph[Num=2] → Item[Num=2] → ItemSentence → Sentence[Num=1]`; consistent law id / revision / title / law type / status / INVENTORY metadata; 二百五十六 ⇄ 256 via the independent kanji parser; a non-circular independent spec with a universal ∀ Nat kernel-checked agreement theorem, 14 `example` decls, five boundary categories and zero forbidden tokens; inclusive 以上 with an exact boundary (255 false, 256 true, 257 true); and correct pin/import/norm-id wiring with the audit at 456/456. The sole concrete discrepancy is a **documentation miscount** (Check 8: doc says 11, actual 12 in Tests / 14 total), with a fix recorded above; it does not affect the code or the source transcription.

This is **not a legal-correctness claim**. The model covers one computable `CONDITION` slice for grayscale gradation levels; the 白色/黒色 definitions, the gated imaging and record-keeping requirements, other items/paragraphs and enforcement rules remain **pending human legal review (LEGAL_REVIEW_PENDING)**.
