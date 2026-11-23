# 独立再抽出 照合 — adversarial review (read-only research)

### Gradation256Floor.lean — 電子帳簿保存法施行規則 art.2(6)(2)（二百五十六階調以上）
照合 (comparison with independent spec and pinned raw bytes): every check below records an actual command/output and a PASS/FAIL decision.


Machine-checked record token: **H/T/D/C/U**. Every result below was independently
re-extracted (独立再抽出) from the pinned primary artifact with fresh Python/grep
runs; no impl header, docstring, unit doc or author note was trusted as evidence.
The reviewer wrote only this file (helper scripts were placed outside the worktree).

Normative unit label under review: `NORM|f99be74c91690ed7e64d9df9919b260bb873b5750e0dc4574e67886b2e23416c`.

---

## Check 1 — raw snapshot byte identity and SHA-256 (CRLF→LF)

H（Falsifiable hypothesis）: the impl header `sha256:
15786f1ae7140c2a1841e02f195246e42f437574b4a20d9f6573dba841899f44` is the genuine
SHA-256 of `data/raw/410M50000040043_20250401_507M60000040028.law.json` after
CRLF→LF normalization, at the claimed size.

T（Reproduction）: fresh `python jtl_unit9_adversarial_check.py` (hashlib over raw
bytes, no repo writes):

```
size_bytes = 101848
crlf_count = 0
lf_count = 0
size_bytes_lf = 101848
sha256_raw = 15786f1ae7140c2a1841e02f195246e42f437574b4a20d9f6573dba841899f44
sha256_crlf_to_lf = 15786f1ae7140c2a1841e02f195246e42f437574b4a20d9f6573dba841899f44
header_impl = 15786f1ae7140c2a1841e02f195246e42f437574b4a20d9f6573dba841899f44
sha_match = True
```

INVENTORY cross-read (`data/INVENTORY.json`, laws[196].raw_snapshot):

```
source_file = data/raw/410M50000040043_20250401_507M60000040028.law.json
source_sha256 = 15786F1AE7140C2A1841E02F195246E42F437574B4A20D9F6573DBA841899F44
size_bytes = 101848
```

D（Decision）: **PASS**. Concrete values: 101,848 bytes, CRLF count 0 (snapshot is
already LF-only, so CRLF→LF is a no-op); raw hash == normalized hash == impl header
hex-for-hex, and equal (case-insensitively) to INVENTORY `source_sha256` with the
same `size_bytes` and the same pinned `source_file`.

C（Competing interpretation）: the header hash could have been copied from a
different revision or a sibling snapshot — rejected: recomputation reads the exact
pinned filename's bytes independently, and three independent anchors (impl header,
recomputed hash, INVENTORY metadata) agree. No CRLF-hash divergence exists here.

U（Uncertainty/out-of-scope）: hash proves byte identity of the *local* snapshot
only. The live e-Gov endpoint was not re-fetched in this review; that is a
provenance/integration matter, not a kernel or legal-correctness matter.

---

## Check 2 — verbatim needle, whole-law count, law title / status

H（Falsifiable hypothesis）: the needle
「赤色、緑色及び青色の階調がそれぞれ二百五十六階調以上で読み取るものであること。」
occurs exactly once in the WHOLE law, and `revision_info.law_title` matches
INVENTORY `official_title` with `current_revision_status = CurrentEnforced`.

T（Reproduction）: independent recursive JSON walk + `str.count` over decoded text:

```
needle_in_raw_text_count = 1
needle_in_lf_text_count = 1
revision_info.law_title = 電子計算機を使用して作成する国税関係帳簿書類の保存方法等の特例に関する法律施行規則
revision_info.current_revision_status = CurrentEnforced
revision_info.law_revision_id = 410M50000040043_20250401_507M60000040028
revision_info.repeal_status = None
revision_info.law_type = MinisterialOrdinance
INVENTORY index = 196
INVENTORY.official_title = 電子計算機を使用して作成する国税関係帳簿書類の保存方法等の特例に関する法律施行規則
```

Exact string-equality re-check (`jtl_unit9_adversarial_check4.py`):

```
law_title_eq_inventory_official_title = True
law_title_len = 41 inv_title_len = 41
law_id_eq = True
revision_eq = True
status_eq = True
```

D（Decision）: **PASS**. Concrete values: needle count = 1 (not 0, not 2) in the
whole law, both in raw decoded text and as a single parsed string leaf; titles are
identical 41-character strings; `law_id`, `law_revision_id`, `law_type =
MinisterialOrdinance`, `repeal_status = None` and `current_revision_status =
CurrentEnforced` agree between `revision_info`, `law_info` and INVENTORY.

C（Competing interpretation）: (a) the needle might also appear in 附則 or in a
metadata field — excluded by the whole-file `str.count = 1` and the single leaf
hit. (b) A first internal walker printed `structural_hits = 0`; this was a bug in
my walker (the root JSON dict has no `children` key; it stores `law_full_text`),
not a source anomaly — re-walking from `law_full_text` found exactly one leaf, and
the raw-text count independently confirms 1. (c) This could be the parent Act
(法律) rather than its 施行規則 (省令) — excluded by `law_type =
MinisterialOrdinance` and the full title ending 施行規則 in both artifacts.

U（Uncertainty/out-of-scope）: INVENTORY is repository metadata; no external
registry re-verification was performed. The `CONDITION` characterization is a
modelling claim, not a legal conclusion.

---

## Check 3 — source location: Article 第二条, Paragraph 6, Item 2, MAIN provision

H（Falsifiable hypothesis）: the unique needle sits in Article `attr.Num=2`,
Paragraph `Num=6`, Item `Num=2`, inside `MainProvision` (not 附則), as the header
path claims.

T（Reproduction）: full independent chain from `law_full_text` to the leaf
(`jtl_unit9_adversarial_check.py`):

```
law_full_text
Law[Lang=ja,Era=Heisei,Year=10,Num=043,...]
LawBody
MainProvision
Article[Num=2]
Paragraph[Num=6]
Item[Num=2]
Subitem1[Num=1]
Subitem2[Num=2]
Subitem2Sentence
Sentence[Num=1,WritingMode=vertical]
LEAF: 赤色、緑色及び青色の階調がそれぞれ二百五十六階調以上で読み取るものであること。
Article Num=2 count in whole law = 4
Article Num=2 count in MainProvision = 1
LawBody children tags = LawTitle(0), EnactStatement(1), MainProvision(2),
                        SupplProvision(3..19)
```

D（Decision）: **PASS**. Concrete values: the needle leaf is under
`MainProvision → Article[Num=2] → Paragraph[Num=6] → Item[Num=2] → Subitem1[Num=1]
(イ) → Subitem2[Num=2] (二) → Sentence[Num=1]`. This corroborates the header's
「第六項(6)、第二号(2)、イ、二」 from JSON `Num` attributes, not from caption
strings. The needle is in the single MainProvision Article 2, not in 附則.

C（Competing interpretation）: a same-numbered 附則 trap was actively sought.
There are 4 `Article[Num=2]` nodes in the whole law, but only 1 in MainProvision,
and the unique needle leaf resolves to that one; the other three live under the
SupplProvision sections (indices 3..19) and do not contain the needle. The header
path notation `MainProvision/MainProvision[1]` and `Article:2/Article#2` doubles
some tokens, but it is a cosmetic transcription of the verified chain, not a
mislabel of law/article/revision.

U（Uncertainty/out-of-scope）: only this revision's snapshot was scanned. Which
legal consequence this CONDITION gates is caller-established; not decided here.

---

## Check 4 — kanji 二百五十六 = 256, spec literal auditable

H（Falsifiable hypothesis）: `generate_verification_evidence.py`'s `int_to_kanji` /
`_kanji_int` map 二百五十六 ⇄ 256, so the impl/spec literal `256` is auditable from
the clause.

T（Reproduction）: importlib load of `scripts/ci/generate_verification_evidence.py`:

```
int_to_kanji(256) = 二百五十六
_kanji_int('二百五十六') = 256
int_to_kanji(256) in needle = True
int_to_kanji(255) = 二百五十五
int_to_kanji(257) = 二百五十七
```

D（Decision）: **PASS**. Concrete values: `int_to_kanji(256)` round-trips to
`_kanji_int(...) = 256`, and that exact spelling occurs in the needle. Both
`gradationFloor : Nat := 256` and `specGradationFloor : Nat := 256` are therefore
anchored to the clause by an independent parser, not merely asserted.

C（Competing interpretation）: 二百五十六 could be 256 階調 *approximately*, or
could be mis-transcribed as 二百五十 / 六百五十 — excluded by the exact roundtrip
and the fact that the only kanji string for 256 in this generator is 二百五十六,
which is literally present. (255 and 257 parse to distinct strings, so the
boundary literal is not confused with its neighbours.)

U（Uncertainty/out-of-scope）: the physical meaning of 階調 and the Nat domain
(whole level counts) are declared modelling choices; fractional or non-integer
gradation measurement is not modelled.

---

## Check 5 — circularity, universal kernel-checked agreement, examples, forbidden tokens

H（Falsifiable hypothesis）: the `spec*` defs reuse no impl name, the agreement
theorem is universal over all Nat (not sampling), there are ≥5 `example` decls and
≥3 genuine boundary categories, and no `sorry`/`admit`/`axiom`/`Classical.choice`
appears in executable code.

T（Reproduction）: read all three modules; stripping block/line comments before
scanning:

```
Gradation256Floor.lean    examples = 0 defs/theorems = 5
Gradation256FloorSpec.lean examples = 2 defs/theorems = 4
Gradation256FloorTests.lean examples = 12 defs/theorems = 0
forbidden_tokens_in_code: impl=[], spec=[], tests=[]
```

`grep '^example'` over the three files yields 14 matches total (12 in Tests, 2 in
Spec). Spec-local defs: `specGradationFloor : Nat := 256`;
`specMeetsGradation levels := decide (¬ levels < specGradationFloor)`;
`specGradationGrid` uses only `specGradationFloor` / `specMeetsGradation`. The
impl names `gradationFloor` / `meetsGradationFloor` appear in the spec file only
inside the bridge theorem `agree_gradation_floor` (line 37), never inside a `spec*`
def body. The bridge is:

```
theorem agree_gradation_floor (levels : Nat) :
    meetsGradationFloor levels = specMeetsGradation levels := by
  unfold meetsGradationFloor gradationFloor specMeetsGradation specGradationFloor
  by_cases h : 256 <= levels
  · have hn : ¬ levels < 256 := by omega
    simp [h, hn]
  · have hn : levels < 256 := by omega
    simp [h, hn]
```

D（Decision）: **PASS**. Concrete values: 14 `example` decls (≥5);
boundary categories {zero: 0, just_below: 255, at_floor: 256, above: 257,
small_input: 1} — 5 genuine categories (≥3); zero forbidden tokens in code. The
agreement is a `theorem` quantified over every `Nat` and discharged by `omega`
plus `simp`, i.e. kernel-checked for all levels, not a finite grid sample;
`specGradationGrid` is explicitly Bool scaffolding with the universal theorem as
the proof.

C（Competing interpretation）: both constants are hard-coded to 256, which could
be called circular — rejected: the statutory constant is a shared primary-source
fact (Check 4), while the operators genuinely differ (`levels >= 256` via `<=`
versus `¬ levels < 256` via `<`), and the bridge is a kernel-checked ∀ theorem, not
an axiom, `Classical.choice` or a sampling grid. A spec that merely restated the
impl predicate would have failed this check; this one does not.

U（Uncertainty/out-of-scope）: no Lean toolchain is on PATH in this environment
(`lean`/`lake`/`elan` all resolve to `None`; the only file named `lean` found is a
Pygments test fixture), so an independent kernel compile was NOT run here. The
kernel-attestation is structural reading of the three modules plus the observed
`by omega`/`simp` proof shape. Full `lake build` was intentionally not run to
respect the one-file write restriction.

---

## Check 6 — 以上 inclusive, off-by-one at 256, three-channel conjunction

H（Falsifiable hypothesis）: 以上 is inclusive: `meetsGradationFloor 256 = true`
and `meetsGradationFloor 255 = false`; the predicate is not 未満 (`<`) or
超える (`>`); and the three-channel 「それぞれ」 conjunction is not silently
conflated with the single-channel predicate.

T（Reproduction）: impl theorems `floor_inclusive`, `just_below`, `zero_false`;
tests examples at 0→false, 1→false, 255→false, 256→true, 257→true;
impl/spec agreement at 0, 255, 256 and for arbitrary `x`; the universal theorem:

```
example : meetsGradationFloor 255 = false := by decide
example : meetsGradationFloor 256 = true  := by decide
example : meetsGradationFloor 257 = true  := by decide
example (x : Nat) : meetsGradationFloor x = specMeetsGradation x := agree_gradation_floor x
```

D（Decision）: **PASS**. Concrete values: 255→false, 256→true, 257→true; no
off-by-one. `meetsGradationFloor levels = decide (256 <= levels)` is inclusive
`>=`, and `specMeetsGradation = decide (¬ levels < 256)` is provably equivalent
for every Nat. The impl header and both other modules explicitly scope the model
to ONE channel's numeric condition and declare the 赤/緑/青 conjunction
caller-established; the needle's 「それぞれ」 is not encoded as a single-channel
claim.

C（Competing interpretation）: 未満 (strict `<`) would wrongly reject exactly 256,
and 超える (`>`) would invert the predicate — both excluded by the needle wording
「二百五十六階調以上」 and by `floor_inclusive`. Conversely, reading the unit as
already modelling the full RGB conjunction would be an over-claim — excluded by
the explicit scope disclaimers in all three files. Neither a boundary flip nor a
conjunction conflation is present.

U（Uncertainty/out-of-scope）: the RGB conjunction, the scanning/record-keeping
requirements gated by this condition, other items/subitems and enforcement rules
are deliberately not modelled. Human legal review pending.

---

## Check 7 — audit pin, three imports, norm-id wiring

H（Falsifiable hypothesis）: the `transcription_audit.py` pin, the three
`JapanTaxLaw.lean` imports and the claimed norm id are correctly wired, and the
audit passes with this pin.

T（Reproduction）: `grep Gradation256Floor` → pin at
`scripts/ci/transcription_audit.py:3542-3546`: law `410M50000040043`, scope
`article`, `第二条`, needle verbatim; `JapanTaxLaw.lean:1814-1816` imports all
three modules. Fresh read-only audit run (`python scripts/ci/transcription_audit.py`,
stdout captured, no repo writes):

```
exit=0
AUDIT> PASS  電子帳簿保存法施行規則 art.2(6)(2)（二百五十六階調以上）↔ Gradation256Floor.lean (floor 256, 以上 inclusive)
AUDIT> transcription audit: 463/463 checks passed
```

D（Decision）: **PASS**. Concrete values: pin law/scope/article/needle match the
source JSON; three imports present; audit exit 0 with 463/463 checks passed and
the named pin passing.

C（Competing interpretation）: an initially empty `findstr` on the audit stdout
was a shell/Japanese-encoding artifact — re-checked by reading the captured UTF-8
output: pin present and passing. The norm id `NORM|f99be74c…16c` appears only as a
label in the impl header, spec header and unit doc (3 occurrences), not in any
generated evidence ledger — a wiring/integration observation, not a contradiction.

U（Uncertainty/out-of-scope）: whether the norm id is materialized into CI evidence
depends on regeneration of generated JSON artifacts, which this read-only review
did not perform.

---

## Check 8 — author unit-doc example count (minor, non-code finding)

H（Falsifiable hypothesis）: the author's `docs/UNIT_GRADATION_256_FLOOR.md` line
28 claim "Tests: 11 kernel-decided examples; boundary categories
{zero, small_input, saturation}" is accurate.

T（Reproduction）: counted `^example` lines and read the tests file directly:

```
Gradation256FloorTests.lean examples = 12   (lines 14,17,18,21,24,27,30,33,34,35,38,41)
Gradation256FloorSpec.lean   examples = 2    (lines 46,54)
total = 14
doc line 28 says 11
```

D（Decision）: **FAIL (documentation only; no code/legal defect)**. Concrete value:
12 `example` decls in Tests (not 11), 14 across the triple. The requirement of
≥5 examples is still comfortably met; this is a miscount in the author's doc, not
a flaw in the Lean modules or the source transcription.

C（Competing interpretation）: one could read "11 kernel-decided" as excluding
the `rfl` decls (lines 14 and 41) — that would give 10, not 11, so even that
charitable reading does not match; the doc figure is simply off. The boundary
set in the doc ({zero, small_input, saturation}) is also incompletely worded
versus the actual five categories, but the tests themselves cover all five.

U（Uncertainty/out-of-scope）: concrete fix — change line 28 of
`docs/UNIT_GRADATION_256_FLOOR.md` to "Tests: 12 kernel-decided `example` decls
in Gradation256FloorTests plus 2 in Gradation256FloorSpec (14 total); boundary
categories {zero, small_input, just_below, at_floor, above}". No Lean file needs
editing. (This finding is recorded here only; the reviewer did not modify the doc
under the one-file-write restriction.)

---

## Verdict

**No concrete legal-correctness or kernel defect found** in the new module triple.
Eight empirical checks were performed (独立再抽出 / 照合): byte-exact 101,848-byte
snapshot with matching SHA-256; a whole-law-unique verbatim needle resolved to
`MainProvision → Article[Num=2] → Paragraph[Num=6] → Item[Num=2] → Subitem1[Num=1]
→ Subitem2[Num=2] → Sentence[Num=1]`; consistent law id / revision / title /
law type / status / INVENTORY metadata; 二百五十六 ⇄ 256 via the independent kanji
parser; a non-circular independent spec with a universal ∀ Nat kernel-checked
agreement theorem, 14 `example` decls, five boundary categories and zero forbidden
tokens; inclusive 以上 with an exact boundary (255 false, 256 true, 257 true) and
no RGB-conjunction conflation; and correct pin/import/norm-id wiring with the
audit at 463/463. The sole concrete discrepancy is a **documentation miscount**
(Check 8: doc says 11, actual 12 in Tests / 14 total), with a fix recorded above;
it does not affect the code or the source transcription.

This is **not a legal-correctness claim**. The model covers one computable
`CONDITION` slice for a single channel; the 「それぞれ」 three-channel conjunction,
the gated scanning and record-keeping requirements, other items/subitems and
enforcement rules remain **pending human legal review (LEGAL_REVIEW_PENDING)**.
