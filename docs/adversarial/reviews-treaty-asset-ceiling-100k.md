# 独立再抽出 照合 — adversarial review (read-only research)

### TreatyAssetCeiling100K.lean — 租税条約等実施特例法施行令 art.6-3(16)(3)（十万円以下）

Machine-checked record token: **H/T/D/C/U**. Every check below was independently
re-extracted (独立再抽出) from the pinned primary artifact. No header, docstring,
unit doc or author note was trusted; all decisions are explicit 照合/判定 from
fresh Python/grep/Lean runs. The reviewer wrote only this file.

Normative unit: `NORM|7e12ccd9d760be2c3ed177e4d172b5eea5ff1d350aa8eb4a23ee7313025e8ce8`

---

## Check 1 — raw snapshot SHA-256 and byte identity

H（Falsifiable hypothesis）: the impl header sha256
`8b21ff78cd78a30af9f90521756b31c40e33d0fd919481bb90822de542421e18` is the real
hash of `data/raw/362CO0000000335_20260521_506CO0000000150.law.json` after
CRLF→LF normalization, with the claimed byte count.

T（Reproduction）: fresh Python (hashlib) over the raw bytes:

```
python review_tac_check1.py
bytes 513843
crlf_count 0
lf_bytes 513843
sha256_raw 8b21ff78cd78a30af9f90521756b31c40e33d0fd919481bb90822de542421e18
sha256_crlf_to_lf 8b21ff78cd78a30af9f90521756b31c40e33d0fd919481bb90822de542421e18
header_impl 8b21ff78cd78a30af9f90521756b31c40e33d0fd919481bb90822de542421e18
```

D（Decision）: **PASS**. 513,843 bytes; CRLF count 0 (snapshot already LF-only, so
CRLF→LF is a no-op); raw hash == normalized hash == impl header byte-for-byte, and
equal (case-insensitively) to `INVENTORY.json` `raw_snapshot.source_sha256`
`8B21FF78CD78A30AF9F90521756B31C40E33D0FD919481BB90822DE542421E18` with
`source_file` = the pinned path and `size_bytes` = 513843.

C（Competing interpretation）: the header could have been copied from another
revision — rejected: recomputation reads the exact pinned filename's bytes
independently and matches both the impl header and repository INVENTORY.

U（Uncertainty/out-of-scope）: hash proves byte identity of the local snapshot only;
the live e-Gov source was not re-fetched in this review.

## Check 2 — verbatim needle, whole-law occurrence count, exact tag path

H（Falsifiable hypothesis）: the needle
「令和七年十二月三十一日における対象特定取引に係る特定取引契約資産額が十万円以下であること。」
occurs exactly once in the WHOLE law, at Article 6-3 / Paragraph 16 / Item 3 /
Sentence 1 in the MAIN provision (not 附則).

T（Reproduction）: independent recursive walk of `json.loads(...)` plus `str.count`
on decoded raw text:

```
needle_in_raw_text_count 1
needle_in_lf_text_count 1
needle hits: 1
chain (top-level -> leaf):
   .law_full_text Law[Num=335]
   .children -> [1] LawBody
   .children -> [2] MainProvision
   .children -> [14] Article[Num=6_3]
   .children -> [17] Paragraph[Num=16]
   .children -> [4] Item[Num=3]
   .children -> [1] ItemSentence
   .children -> [0] Sentence[Num=1]
   .children -> [0] (leaf string)
```

D（Decision）: **PASS**. Count = 1 (not 0, not 2) in the whole law. Leaf path resolves
to `LawBody → MainProvision → Article(attr.Num=6_3) → Paragraph(attr.Num=16) →
Item(attr.Num=3) → ItemSentence → Sentence(Num=1)`. The Item is numbered 三 with
`attr.Num="3"`; it is an Item, not an イ/ロ `Subitem1` — so the label art.6-3(16)(3)
is corroborated from the JSON `Num` attributes, not from the caption strings.
This matches the impl header `Article:6_3/Article#6_3/Paragraph#16/Item#3/...`.

C（Competing interpretation）: a same-numbered 附則 article trap was actively sought.
`LawBody` children = `[0] LawTitle, [1] EnactStatement, [2] MainProvision,
[3..51] SupplProvision`. A full scan for `Article attr.Num=6_3` found **count 1**,
at `law_full_text / Law[1] / LawBody[2] / MainProvision[14]` only. The 附則 has an
`Article Num=6` (section[48]) but **no** `Num=6_3`, so there is no same-numbered
supplementary-article trap here. Nearby conditions were also distinguished:
Paragraph 15 item 1 uses 二千五百万円以下, Paragraph 22 item 1 uses 一億円を超える,
Paragraph 24 item 3 defines 特定取引契約資産額 generically — none is this needle.

U（Uncertainty/out-of-scope）: scanning limited to this revision's snapshot; the
unique needle pins the literal, but the legal characterization of the condition
(CONDITION gating the Paragraph-16 relaxation) is caller-established.

## Check 3 — revision_info vs INVENTORY, title, law type, status

H（Falsifiable hypothesis）: `revision_info.law_title` equals the INVENTORY
`official_title` / `current_revision.law_title`, and law id, revision id, law type
and current revision status are mutually consistent.

T（Reproduction）: Python JSON reads:

```
revision_info.law_title = 租税条約等の実施に伴う所得税法、法人税法及び地方税法の特例等に関する法律施行令
current_revision_status = CurrentEnforced
law_revision_id = 362CO0000000335_20260521_506CO0000000150
INVENTORY laws[158] official_title = 租税条約等の実施に伴う所得税法、法人税法及び地方税法の特例等に関する法律施行令
INVENTORY current_revision.law_revision_id = 362CO0000000335_20260521_506CO0000000150
INVENTORY current_revision_status = CurrentEnforced
INVENTORY law_type = CabinetOrder
```

D（Decision）: **PASS**. Titles are identical strings; law_id `362CO0000000335`,
revision `362CO0000000335_20260521_506CO0000000150`, `law_type=CabinetOrder`
(政令), `repeal_status=None`, `current_revision_status=CurrentEnforced` agree in
both sources and with the impl header.

C（Competing interpretation）: could be the parent Act (租税条約等実施特例法, a 法律)
rather than its 施行令 (政令) — excluded: `law_type=CabinetOrder` and the full title
ends 施行令 in both artifacts; the module name "TreatyAssetCeiling..." is only an
English shorthand, not a mislabel of the Japanese title.

U（Uncertainty/out-of-scope）: INVENTORY is repository metadata; no external registry
re-verification was performed.

## Check 4 — kanji 十万 = 100,000, spec literal auditable, date out of scope

H（Falsifiable hypothesis）: `generate_verification_evidence.py`'s `int_to_kanji` /
`_kanji_int` map 十万 ⇄ 100,000, so the spec literal `100_000` is auditable from the
clause; the date numerals 令和七年十二月三十一日 are a different scope.

T（Reproduction）: `importlib.util.spec_from_file_location('gve', scripts/ci/
generate_verification_evidence.py)` then:

```
int_to_kanji(100000) = '十万'
_kanji_int("十万") = 100000
int_to_kanji(100000) in needle = True
variants of 100000 = ['十万']
date tokens: _kanji_int('七')=7, _kanji_int('十二')=12, _kanji_int('三十一')=31
```

D（Decision）: **PASS**. `int_to_kanji(100000)` round-trips to 十万 and that exact
spelling occurs in the pinned clause; the only kanji variant for 100,000 is 十万.
The date numerals parse as 7/12/31, not as the spec literal, so the literal
`100_000` is supported by 十万 and the reference date is correctly left out of scope.

C（Competing interpretation）: 十万 could be a round/approximate expression —
excluded by `十万円以下` context and the roundtrip parser; the clause says 以下, not
about/approximately. (If it were 未満 or 超える the boundary would differ — see Check 6.)

U（Uncertainty/out-of-scope）: whole-yen (Nat) domain is a declared modelling choice
(header: "Unit 円; domain Nat (whole yen)"); fractional-yen treatment and the
currency-conversion definition in art.6-3(24)(3) are caller-established and not
modelled.

## Check 5 — circularity, universal kernel-checked agreement, examples, forbidden tokens

H（Falsifiable hypothesis）: spec defs reuse no impl names, the agreement theorem is
universal over all Nat and kernel-checked (not finite sampling), there are ≥5
`example` decls and ≥3 genuine boundary categories, and no
`sorry`/`admit`/`axiom`/`Classical.choice` exists.

T（Reproduction）: read all three modules. `grep '^example'` over
`TreatyAssetCeiling100K*.lean` → **13 matches** (12 in Tests, 1 in Spec). Spec:
`specAssetCeiling : Nat := 100_000`; `specWithinAsset a := decide (¬ specAssetCeiling < a)`;
`specAssetGrid` uses only spec-local names — **no impl name inside any `spec*` def**.
Bridge: `theorem agree_asset_ceiling (amount : Nat) :
withinAssetCeiling amount = specWithinAsset amount`, proved for all Nat via
`by_cases h : amount <= 100_000` + `omega` in both branches. Independent standalone
kernel check (no repo imports, Lean 4.35.0 via `elan run`):

```
theorem agree (amount : Nat) : withinAssetCeiling amount = specWithinAsset amount := by
  unfold withinAssetCeiling assetCeiling specWithinAsset specAssetCeiling
  simp [Nat.not_lt]
--> lean exited 0 (no errors)
```

grep for `sorry|admit|axiom|Classical.choice|unsafe` across the three modules →
only the comment line in the impl: "No `sorry`, `admit`, `axiom` or `Classical.choice`."

D（Decision）: **PASS**. Universal ∀ Nat theorem (not finite sampling); 13 `example`
decls; ≥3 genuine boundary categories {zero: 0, small_input: 1, just_below: 99_999,
at_ceiling: 100_000, above: 100_001}; zero forbidden tokens. The core equivalence
`decide (a <= 100000) = decide (¬ 100000 < a)` is kernel-checked standalone; the
repo's own universal theorem is a normal `theorem`, not an assumption.

C（Competing interpretation）: both constants hard-coded to 100_000 could be called
circular — rejected: the statutory constant is the shared primary-source fact,
while the operators genuinely differ (`amount <= c` vs `¬ c < amount`) and the
bridge is a kernel-checked ∀ theorem, not an axiom or a finite grid.

U（Uncertainty/out-of-scope）: the full `lake build` was intentionally not run because
it would write build artifacts into the worktree (violating the one-file write
restriction); kernel attestation here is (a) structural reading of the three modules
and (b) a standalone Lean 4.35.0 check of the central identity. Toolchain-version-
specific full-library compilation is therefore not attested by this review.

## Check 6 — 以下 inclusive; off-by-one at 100,000

H（Falsifiable hypothesis）: 以下 is inclusive: `withinAssetCeiling 100_000 = true`
and `withinAssetCeiling 100_001 = false`; the predicate is not 未満 (`<`) or
超える (`>`).

T（Reproduction）: impl theorems `ceiling_inclusive`, `first_above`, `zero_true`;
tests examples at 0→true, 1→true, 99_999→true, 100_000→true, 100_001→false;
impl/spec agreement at 0, 100_000, 100_001; standalone `by decide` checks:

```
example : withinAssetCeiling 100_000 = true  -- decided true
example : withinAssetCeiling 100_001 = false -- decided false
example : withinAssetCeiling  99_999 = true
example : specWithinAsset     100_000 = true
example : specWithinAsset     100_001 = false
```

D（Decision）: **PASS**. Boundary exact: 100,000 accepted, 100,001 rejected, no
off-by-one. `withinAssetCeiling` is `decide (amount <= 100_000)` — inclusive `<=`.

C（Competing interpretation）: 未満 (strict `<`) would wrongly reject exactly 100,000;
超える (`>`) would invert the predicate; 「十万を超える」 or 「十万未満」 do not appear in
the needle (the needle says 「十万円以下」). The universal agreement theorem also
excludes both alternative readings because `¬ 100000 < a` ≡ `a <= 100000`.

U（Uncertainty/out-of-scope）: the legal effect gated by this condition (the
Paragraph-16 relaxation of 住所等所在地国の特定) is explicitly not modelled; human
legal review pending.

## Check 7 — audit pin, three imports, norm id wiring

H（Falsifiable hypothesis）: the transcription_audit pin, the three `JapanTaxLaw.lean`
imports and the claimed norm id are correctly wired.

T（Reproduction）: `grep TreatyAssetCeiling100K` → pin at
`scripts/ci/transcription_audit.py:3364-3368`: law `362CO0000000335`, scope
`article`, `第六条の三`, needle verbatim. `JapanTaxLaw.lean:1705-1707` imports all
three new modules. Full audit run:

```
python scripts/ci/transcription_audit.py
line 430: PASS  租税条約等実施特例法施行令 art.6-3(16)(3)（特定取引契約資産額十万円以下）↔ TreatyAssetCeiling100K.lean (ceiling 100_000, 以下 inclusive)
line 432: transcription audit: 430/430 checks passed
```

D（Decision）: **PASS**. Pin/imports/norm id are consistent with the source JSON and
the audit reports 430/430 with this pin passing.

C（Competing interpretation）: an initially empty `findstr` on the audit stdout was
a shell/encoding artifact (Japanese output), not a missing pin — re-checked by
reading the captured output and by ripgrep; pin present. No defect.

U（Uncertainty/out-of-scope）: the claimed norm id is a label pinned by this unit;
its inclusion in any generated evidence ledger depends on CI regeneration, which
is an integration matter, not a legal-correctness or kernel defect.

---

## Verdict

**No concrete defect found.** All seven empirical checks are PASS: byte-exact
snapshot hash (513,843 bytes); whole-law-unique verbatim needle located in the
MAIN-provision Article 6-3, Paragraph 16, Item 3 (confirmed from `attr.Num`, an
Item numbered 三 — not an イ/ロ subitem, and with no same-numbered 附則 Article 6-3
trap); consistent title/revision/law-type/status/INVENTORY metadata; 十万 = 100,000
with the date out of scope; a non-circular independent spec with a universal
kernel-checked agreement theorem, 13 `example` decls, ≥3 boundary categories and
zero forbidden tokens; inclusive 以下 with an exact boundary (100,000 true,
100,001 false); and correct pin/import/norm-id wiring with 430/430 audit PASS.
The only non-defect nuances are the declared whole-yen/Nat modelling choice and
the fact that a full `lake build` was not run to respect the one-file write limit.

This is **not a legal-correctness claim**. The model covers one computable
CONDITION slice only; the reference date 令和七年十二月三十一日, the identification of
対象特定取引 and 特定取引契約資産額, the gated legal effect, other items/paragraphs
and enforcement rules remain **pending human legal review (LEGAL_REVIEW_PENDING)**.
