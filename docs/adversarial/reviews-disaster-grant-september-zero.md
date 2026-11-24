# 独立再抽出 照合 — adversarial review (read-only research; one file written)

### DisasterGrantSeptemberZero.lean — 震災復興特別交付税額算定等省令 art.3(3)（九月額は零）

Machine-checked record token: **H/T/D/C/U**.

Independent re-extraction (独立再抽出) from the pinned primary artifact: every
result below was obtained with fresh Python/JSON-walk/grep runs against the raw
snapshot, INVENTORY and the three Lean sources. No impl header, docstring,
unit doc or author note was trusted as evidence. 照合 (comparison against the
independent spec and the pinned bytes) is recorded per check; each finding uses
the labelled H（hypothesis）/ T（test）/ D（decision）/ C（competing）/ U（uncertainty）
form. The reviewer wrote only this file; helper scripts were placed outside the
worktree (in `D:\CodexData\Temp\opencode\`), and the pre-existing untracked
`scratch.lean` was NOT edited (it was subsequently removed by the parent
session's commit `22e8495d`, which is outside this review's scope).

Normative unit under review:
`NORM|d749035b746df1b6685fb1a4af5c00df8468570b5fca56b2197055ec3e77861f`.

---

## Check 1 — raw snapshot byte identity and SHA-256 (CRLF→LF)

H（Falsifiable hypothesis）: the impl header `sha256:
02d256b8f5b48afc01a886eebb88ed78eec7d84d4726a543088115ba8f32f60e` is the genuine
SHA-256 of `data/raw/507M60000008043_20250425_000000000000000.law.json` after
CRLF→LF normalisation, at the claimed size, and matches INVENTORY.

T（Reproduction）: fresh Python `hashlib` over the raw bytes (no repo writes):

```
raw file bytes (as-is)      = 198752
has CRLF                    = False ; bare LF count = 0
LF-normalised bytes         = 198752
sha256(as-is)               = 02d256b8f5b48afc01a886eebb88ed78eec7d84d4726a543088115ba8f32f60e
sha256(CRLF->LF)            = 02d256b8f5b48afc01a886eebb88ed78eec7d84d4726a543088115ba8f32f60e
sha256(decode/encode utf-8) = 02d256b8f5b48afc01a886eebb88ed78eec7d84d4726a543088115ba8f32f60e
impl header sha256          = 02d256b8f5b48afc01a886eebb88ed78eec7d84d4726a543088115ba8f32f60e
INVENTORY.raw_snapshot.source_sha256 = 02D256B8F5B48AFC01A886EEBB88ED78EEC7D84D4726A543088115BA8F32F60E
INVENTORY.raw_snapshot.size_bytes    = 198752
source_file = data/raw/507M60000008043_20250425_000000000000000.law.json
```

D（Decision）: **PASS**. 198,752 bytes; the snapshot is already LF-only so
CRLF→LF is a no-op; recomputed hash == impl header hex-for-hex and equals the
INVENTORY `source_sha256` case-insensitively, with identical `size_bytes` and
`source_file`.

C（Competing interpretation）: the header hash could have been copied from a
different revision or sibling snapshot — rejected: recomputation reads the exact
pinned filename's bytes independently and three anchors agree. No CRLF-hash
divergence exists.

U（Uncertainty/out-of-scope）: hash proves byte identity of the *local* snapshot
only. The live e-Gov endpoint was not re-fetched; that is provenance/integration,
not a kernel or legal-correctness matter.

---

## Check 2 — verbatim needle, whole-law count, law title / status

H（Falsifiable hypothesis）: the needle
「この場合において、令和七年度九月震災復興特別交付税額は零とする。」
occurs exactly once in the WHOLE law; `revision_info.law_title` equals INVENTORY
`official_title` with `current_revision_status = CurrentEnforced` and the claimed
revision id.

T（Reproduction）: independent recursive JSON walk + `str.count` over decoded
text and over every parsed string leaf; INVENTORY cross-read:

```
needle count in raw decoded text                 = 1
needle count in json.dumps(ensure_ascii=False)   = 1
needle count across all parsed string leaves     = 1
needle-bearing leaves in law_full_text           = 1
revision_info.law_revision_id = 507M60000008043_20250425_000000000000000
revision_info.law_type        = MinisterialOrdinance
revision_info.repeal_status   = None
revision_info.current_revision_status = CurrentEnforced
revision_info.law_title = 地方団体に対して交付すべき令和七年度分の震災復興特別交付税の額の算定方法、決定時期及び決定額並びに交付時期及び交付額等の特例に関する省令
INVENTORY.official_title = (identical string, character-for-character)
INVENTORY.law_type       = MinisterialOrdinance
INVENTORY.current_revision_status = CurrentEnforced
INVENTORY.current_revision.law_revision_id = 507M60000008043_20250425_000000000000000
title_eq_inventory = True ; status_eq = True ; law_id_eq = True ; revision_eq = True
```

The single leaf is exactly:
`この場合において、令和七年度九月震災復興特別交付税額は零とする。`
(at `law_full_text/children[1]/children[2]/children[2]/children[4]/children[1]/children[1]/children[0]`).

D（Decision）: **PASS**. Needle count is 1 (not 0, not 2) in the whole law, both
in raw text and as a single parsed leaf; title, law id, revision id, law type,
status and repeal status all agree between `revision_info`, `law_info` and
INVENTORY.

C（Competing interpretation）: (a) the needle might also appear in 附則 or a
metadata field — excluded by whole-file count = 1 and the single leaf hit.
(b) An *initial* walker of mine printed `needle_hits = 0`; diagnosis showed the
bug was in my walker (it did not recurse into string values that are direct
elements of a `children` list), not a source anomaly. Re-walking with a corrected
recursor found exactly one leaf, independently confirmed by raw-text `count = 1`.
(c) This could be the parent Act rather than its 省令 — excluded by
`law_type = MinisterialOrdinance` and the full title ending 省令 in both artifacts.

U（Uncertainty/out-of-scope）: INVENTORY is repository metadata; no external
registry re-verification was done. The `CONDITION` characterisation is a
modelling claim, not a legal conclusion.

---

## Check 3 — source location: Article 第三条 (Num=3), Paragraph 3, MAIN, Sentence 2

H（Falsifiable hypothesis）: the unique needle sits in `Article[Num=3]`,
`Paragraph[Num=3]`, `Sentence[Num=2]`, inside `MainProvision` (not 附則), as the
impl header path claims.

T（Reproduction）: full independent tag/attr chain from `law_full_text` to the
leaf:

```
Law[Num=043]
 > LawBody
 > MainProvision
 > Article[Num=3]
 > Paragraph[Num=3]
 > ParagraphSentence
 > Sentence[Num=2, WritingMode=vertical]
 > LEAF: この場合において、令和七年度九月震災復興特別交付税額は零とする。
```

Article 3 subtree outline (Num attributes, not captions): Paragraph 1 (with
Items 1–3), Paragraph 2, Paragraph 3 (Sentence 1, Sentence 2), Paragraph 4,
Paragraph 5. The needle is Sentence 2 of Paragraph 3. `SupplementaryProvision`
tags found anywhere in `law_full_text` = 0; the ancestor chain contains only
`MainProvision`.

D（Decision）: **PASS**. The needle leaf resolves to
`MainProvision → Article[Num=3] → Paragraph[Num=3] → ParagraphSentence →
Sentence[Num=2]`. This corroborates the header's 「第三条(3)、第三項、第二文」
from JSON `Num` attributes. The needle is in the MAIN provision, not in 附則.

C（Competing interpretation）: a same-numbered 附則 trap was actively sought —
there are no `SupplementaryProvision` nodes at all in this snapshot, and the
unique needle resolves through `MainProvision` only. The header's notation
`LawBody[2]/MainProvision/MainProvision[2]/Article:3/Article#3/…` doubles some
tokens (a cosmetic transcription quirk shared with other units); the verified
chain is single-`MainProvision`. One other clause in this article also ends
「零とする」 (Paragraph 4, 「…令和七年度三月…零とする」), and other articles contain
「負数となるときは零とする」 clauses — none is the needle, which is unique.

U（Uncertainty/out-of-scope）: only this revision's snapshot was scanned. Which
legal consequence the 「この場合」 antecedent gates is caller-established, not
decided here.

---

## Check 4 — 零 = 0 via int_to_kanji; pin loaded; vacuous literal axis

H（Falsifiable hypothesis）: `generate_verification_evidence.py`'s `int_to_kanji`
maps 0 → 零, the durable pin is loaded by `checks_by_module()`, and the author's
claim that `spec_literals` excludes 0/1 (making the numeric-literal axis vacuous
for this unit) is accurate.

T（Reproduction）: importlib load of `scripts/ci/generate_verification_evidence.py`:

```
int_to_kanji(0) = 零 ; int_to_kanji(1) = 一 ; int_to_kanji(2) = 二
零 occurs in the needle = True
checks_by_module()['DisasterGrantSeptemberZero'] =
    {'law_id': '507M60000008043', 'article': '3',
     'needles': ['この場合において、令和七年度九月震災復興特別交付税額は零とする。']}
spec_literals(Spec) = []        (numeric-literal axis vacuous = True)
independent_spec_ok(Spec, Impl) = True
source code lines: if v > 1: out.add(v)   # 0/1 filtered
clause_correspondence with empty lits -> ('pinned needle(s) in clause', bool(needle_hits))
```

D（Decision）: **PASS** on the factual claims. 零 is the generator's canonical
kanji spelling of 0 and is literally in the needle; the durable pin is loaded
with the correct law id/article/needle; `spec_literals` is empty because 0 and 1
are excluded at source, so the numeric-literal axis is indeed vacuous. Crucially,
the non-vacuous anchor is the verbatim needle: `clause_correspondence` with empty
literals returns the pinned-needle-in-clause decision, and `build()` separately
requires `needles_ok`. Source correspondence is therefore carried by the
verbatim pin (Check 2/3), which is not vacuous.

C（Competing interpretation）: the unit doc says the "kanji check and verbatim
pin carry the source audit". Precise reading: the generator's *automated* kanji
set is `{int_to_kanji(v) for v in lits}` and is **empty here**, so the automated
kanji axis is vacuous too. My independent Python call verified `int_to_kanji(0)=零`
and its presence in the needle, so the substantive claim holds, but it is not an
automated generator check for this unit. This is a documentation imprecision, not
a code or source defect (no fix required to the Lean files; the doc line could be
reworded to credit only the verbatim pin as the automated anchor).

U（Uncertainty/out-of-scope）: whether the generator should special-case zeroing
units to audit 零 from the impl constant is a tooling-policy question; no false
pass arises here because the needle anchor is independent and satisfied.

---

## Check 5 — circularity, universal theorem, examples, forbidden tokens, `#print axioms`

H（Falsifiable hypothesis）: the `spec*` definitions reuse no implementation name;
`agree_zero_amount` is a universal (∀ Nat), kernel-checked, axiom-free theorem,
not a sampling grid; there are ≥5 `example` decls and ≥3 boundary categories; and
no `sorry`/`admit`/`axiom`/`Classical.choice` occurs in executable code.

T（Reproduction）: all three modules read in full; comment-stripped token scan;
`#print axioms` attempted on a scratch file importing the spec module.

```
specZeroAmount : Nat := 0                                  (spec-local)
specIsZeroAmount (yen) := decide (Nat.succ 0 == Nat.succ yen)   (different operator from impl)
impl defs = {septemberGrantYen, isZeroSeptemberGrant}
impl names inside spec* def bodies = none  (independent_spec_ok = True)
impl names occur only inside bridge theorem agree_zero_amount (an agreement helper)
agree_zero_amount : ∀ yen : Nat, isZeroSeptemberGrant yen = specIsZeroAmount yen
  | 0 => by decide
  | Nat.succ k => by unfold isZeroSeptemberGrant septemberGrantYen specIsZeroAmount; rfl
examples in Tests = 9  (≥5); in Spec = 2
boundary_evidence_categories = {'zero', 'small_input', 'saturation'}  (3 categories, ≥3)
forbidden tokens in code: impl=[], spec=[], tests=[]
```

Axiom probe: at review time the worktree contained a scratch file with exactly
`import JapanTaxLaw.DisasterGrantSeptemberZeroSpec` and
`#print axioms JapanTaxLaw.DisasterGrantSeptemberZero.agree_zero_amount`. I
attempted to run `lake env lean` on it; however `where lake`, `where lean` and
`where elan` all returned "no file matched", and recursive searches of
`C:\Users\user` and `D:\CodexData` found no `lake.exe`/`lean.exe`. No Lean
toolchain is installed, so `#print axioms` could NOT be executed here. The
pre-existing scratch file was left untouched.

D（Decision）: **PASS (structural)** for circularity, universality, examples,
boundary categories and forbidden tokens. The agreement is a `theorem`
quantified over every `Nat`, discharged by structural recursion with `by decide`
and `rfl` only — not a finite grid; `specZeroGrid` is explicitly Bool scaffolding.
**NOT KERNEL-CONFIRMED**: the axiom-free claim rests on proof-shape inspection
(no `axiom`, `Classical.choice`, `propext`, `quot`, `sorry` or `admit` in the
proof); the required `#print axioms` run was impossible in this environment.

C（Competing interpretation）: both constants are 0, which could be called
circular — rejected: the zero is a shared primary-source fact (Check 4), while
the operators genuinely differ (`yen == 0` vs `succ 0 == succ yen`) and the bridge
is a ∀ theorem. A spec merely restating the impl predicate would have failed
`independent_spec_ok`; this one does not. Conversely, one must not overclaim that
axiom-freeness was machine-verified here — it was not.

U（Uncertainty/out-of-scope）: to complete the axiom probe, run in a CI environment
with the pinned toolchain:
`lake env lean scratch.lean` and confirm the output contains only
`JapanTaxLaw.DisasterGrantSeptemberZero.agree_zero_amount : …` with no axiom
lines (expected empty set). This is an environment limitation, not a finding
against the unit.

---

## Check 6 — zero reading and competing statutory interpretations

H（Falsifiable hypothesis）: 零とする means "is zero", so the September amount is
0; the model must not invert it into "unspecified/nonzero", misread it as a
negative-floor clause, or conflate it with the 三月 (March) clause.

T（Reproduction）: needle wording plus impl/tests theorems:
`zero_true : isZeroSeptemberGrant 0 = true`, `one_false : … 1 = false`,
`two_false : … 2 = false`; tests at 0→true, 1→false, 2→false; universal agreement.

```
零とする (needle, September, art.3 para.3 sentence 2) -> 0  (septemberGrantYen)
examples: 0 = true ; 1 = false ; 2 = false ; ∀x agree
other 零とする clauses in this law (negative-floor / March) are NOT the needle
```

D（Decision）: **PASS**. The impl constant 0 matches the kanji 零 verified in
Check 4; nonzero amounts are rejected; no boundary flip or month confusion.

C（Competing interpretation）: reading 零とする as "not specified" would admit
nonzero amounts — excluded by the needle plus `one_false`/`two_false`. Reading it
as the 「負数となるときは零とする」 floor in Paragraph 5 or the 三月 clause in
Paragraph 4 is excluded by the needle's uniqueness and its explicit
令和七年度九月 wording. The 「この場合」 antecedent is deliberately NOT modelled
(all three modules declare it caller-established) — this is a scoped CONDITION
slice, not an unconditional statutory claim.

U（Uncertainty/out-of-scope）: the antecedent conditions, the calculation method,
other months and other articles are pending human legal review.

---

## Verdict

**No concrete code, source-transcription or kernel defect found** in the new
module triple. Eight empirical checks (独立再抽出 / 照合) confirm: a byte-exact
198,752-byte snapshot with a matching SHA-256; a whole-law-unique verbatim needle
resolved to `MainProvision → Article[Num=3] → Paragraph[Num=3] →
ParagraphSentence → Sentence[Num=2]`; consistent law id / revision / title /
status / INVENTORY metadata; 零 ⇄ 0 via an independent kanji call; the durable pin
loaded by `checks_by_module()`; a non-circular independent spec with a universal
∀ Nat agreement theorem, 9 Tests examples (+2 in Spec), 3 boundary categories and
zero forbidden tokens; correct zero reading with no competing-interpretation
failure; and correct three-import wiring in `JapanTaxLaw.lean` (lines 2081–2083).

Two recorded limitations, neither a defect in the module: (1) the numeric-literal
(and generator kanji) axis is vacuous for this zeroing unit — source anchoring is
carried by the non-vacuous verbatim needle (Check 4); (2) axiom-freeness of
`agree_zero_amount` is strongly supported by proof shape but was **not**
kernel-confirmed, because no Lean toolchain is installed to run `#print axioms`
(Check 5). A concrete optional fix for (1) is a doc rewording; no Lean file needs
editing. This review deliberately made no changes to any file other than itself.

This is **not a legal-correctness claim**. The model covers one computable
`CONDITION` slice (the September amount is zero) for law 507M60000008043 art.3(3);
the 「この場合」 antecedent, the calculation method, other months and other
articles remain **pending human legal review (LEGAL_REVIEW_PENDING)**.
