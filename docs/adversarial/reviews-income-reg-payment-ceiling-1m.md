# 独立再抽出 照合 — adversarial review (read-only research)

### IncomeRegPaymentCeiling1M.lean — 所得税法施行規則 art.87(3)(2)（百万円以下）

Machine-checked record token: **H/T/D/C/U**. Each check below is independently
re-extracted (独立再抽出) from the pinned primary artifact and the decision is an
explicit 照合/判定. Reviewer did not trust any header, docstring or author note.

---

## Check 1 — raw snapshot SHA-256 (byte identity)

H（Falsifiable hypothesis）: the impl header sha256 `8721699516ac82025eea0430429b197da1e58afe195debe1fb441dfea14eacf5` is the actual hash of the pinned file after CRLF→LF normalization.

T（Reproduction）: `powershell -NoProfile -Command python -c 'import hashlib,pathlib; p=pathlib.Path("data/raw/340M50000040011_20261001_507M60000040018.law.json"); b=p.read_bytes(); n=b.replace(b"\r\n",b"\n"); print(len(b),len(n),hashlib.sha256(b).hexdigest(),hashlib.sha256(n).hexdigest())'` →
`bytes_raw 2351567`, `bytes_norm 2351567`, `raw_sha 8721699516ac82025eea0430429b197da1e58afe195debe1fb441dfea14eacf5`, `norm_sha 8721699516ac82025eea0430429b197da1e58afe195debe1fb441dfea14eacf5`.

D（Decision）: **PASS**. 2,351,567 bytes; raw == normalized (snapshot already LF-only); both hashes byte-for-byte equal the header and the uppercase `INVENTORY.json` `raw_snapshot.source_sha256` `8721699516AC82025EEA0430429B197DA1E58AFE195DEBE1FB441DFEA14EACF5`.

C（Competing interpretation）: header could be copied from another revision — rejected because the recomputation reads the raw bytes of the exact pinned filename and matches independently.

U（Uncertainty/out-of-scope）: hash proves byte identity of the local snapshot only; the live e-Gov source was not re-fetched.

## Check 2 — verbatim needle, whole-law count, exact tag path

H（Falsifiable hypothesis）: the needle 「同一人に対するその年中の満期返戻金等の支払金額が百万円以下である場合」 occurs exactly once in the WHOLE law and sits in Article 87 main provision para 3 item 2 sentence 1.

T（Reproduction）: independent recursive DFS over `json.loads(...)` with `str.count`: `TOTAL_OCCURRENCES 1`, `HIT_STRINGS 1`; leaf path
`/law_full_text/children/1/children/3/children/4/children/1/children/44/children/4/children/3/children/1/children/0/children/0`; leaf sha256 `834626419f7ee3ac3495bbb30fe15e321802ceffb17da262b98b7a978b63012c` equals the needle's sha256. Tag walk: `LawBody → MainProvision → Part → Chapter → Article(attr.Num=87) → Paragraph(attr.Num=3) → Item(attr.Num=2) → ItemSentence → Sentence#1`. Independent `task_queue.build_tasks` reconstruction yields `NORM|527ed759ab3fbc4580c09c7b5631fa02674c97e617ae168ed0d0e85a313df13a`, kind CONDITION, at `LawBody[3]/MainProvision/MainProvision[4]/Article:87/Article#87/Paragraph#3/Item#2/ItemSentence/Sentence#1` — matching the header.

D（Decision）: **PASS**. Count = 1 (not 0, not 2); article/paragraph/item numbers 87/3/2 confirmed from `attr.Num`, not from labels.

C（Competing interpretation）: the law HAS a same-numbered 附則 Article 87 (`LawBody[131]/SupplProvision/SupplProvision[87]/Article:87`) — a real same-number trap. Reconstructed 附則 art.87 units have different ids/text and none carries the needle; the needle is in `MainProvision`, so no inheritance of a supplementary provision. Also checked near-duplicates: art.87(3)(1) is a 20万円 condition (`96c14050…`), art.86(3)(2) and art.90(3)(1) are different 百万円 conditions with different norm ids — the unique needle and pinned norm id prevent conflation.

U（Uncertainty/out-of-scope）: scanning limited to this revision's snapshot.

## Check 3 — title / revision / INVENTORY cross-check

H（Falsifiable hypothesis）: `revision_info.law_title` equals the INVENTORY `official_title` and `current_revision.law_title`, and revision/status/pin are consistent.

T（Reproduction）: Python equality checks → `TITLE_IS_INCOME_TAX_ENFORCEMENT_REG True`, `TITLE_EQ_INV_OFFICIAL True`, `TITLE_EQ_INV_CURRENT_REV True`; `STATUS_RAW CurrentEnforced`, `STATUS_INV CurrentEnforced`; `law_revision_id = 340M50000040011_20261001_507M60000040018`; INVENTORY `source_sha256` matches Check 1.

D（Decision）: **PASS**. law_title decodes to 所得税法施行規則 (code points verified), law_type MinisterialOrdinance (省令), status CurrentEnforced in both sources.

C（Competing interpretation）: could be 所得税法施行令 (Cabinet Order) — excluded: law_id 340M50000040011 / title / law_type all say 施行規則 (省令). The header's English gloss "Enforcement Order" is a translation nuance, not a mislabel of the Japanese title or law type.

U（Uncertainty/out-of-scope）: INVENTORY is repository metadata; no external registry re-verification.

## Check 4 — kanji numeral 百万 = 1,000,000

H（Falsifiable hypothesis）: `generate_verification_evidence.py`'s `int_to_kanji`/`_kanji_int` map 百万 ⇄ 1,000,000, so the spec literal is auditable from the clause.

T（Reproduction）: `importlib.util.spec_from_file_location("g", "scripts/ci/generate_verification_evidence.py")` → `int_to_kanji(1000000) == "\u767e\u4e07" True`; `_kanji_int("\u767e\u4e07") 1000000`; `roundtrip 1000000`; `kanji_variants(1000000)` = {百万}; `NEEDLE_SIGNED_AS_million` (百万円以下 in clause) `True`.

D（Decision）: **PASS**. Spec literal `1_000_000` is the kanji 百万 in the pinned clause; `spec_literals = {1000000}` (generator).

C（Competing interpretation）: 百万 as a name/round number — excluded by 百万円以下 context and the roundtrip parser.

U（Uncertainty/out-of-scope）: whole-yen (Nat) domain is a declared modelling choice; fractional-yen treatment is not in scope.

## Check 5 — circularity, universal theorem, examples, forbidden tokens

H（Falsifiable hypothesis）: spec defs are independent, the agreement theorem is universal and kernel-checked, ≥5 examples and 3 genuine boundary categories exist, and no `sorry`/`admit`/`axiom`/`Classical.choice` is present.

T（Reproduction）: read all three modules. `specPaymentCeiling : Nat := 1_000_000`; `specWithinPayment a := decide (¬ specPaymentCeiling < a)`; `specPaymentGrid` uses only spec names — **no impl name inside any `spec*` def**. Bridge is `theorem agree_payment_ceiling (amount : Nat)` proved for all Nat with `by omega` (two `by_cases` on `amount <= 1_000_000`). `independent_spec_ok(spec, impl)` → True; `boundary_evidence_categories` → `{'small_input','saturation','zero'}`; generator example count = 11 in Tests + 1 in Spec; grep for `sorry|admit|axiom|Classical.choice` in the three modules → only the comment line "No `sorry`, `admit`, `axiom` or `Classical.choice`"; grep in imported `TaxFinance.lean` → no matches. `lake build JapanTaxLaw.IncomeRegPaymentCeiling1MTests` → 5/5 built; full `lake build JapanTaxLaw` → 788/788 built successfully.

D（Decision）: **PASS**. Universal ∀ Nat theorem (not finite sampling); 12 `example` decls; 3 boundary categories; zero forbidden tokens; full library compiles.

C（Competing interpretation）: both constants hard-coded to 1_000_000 could be called circular — rejected: the statutory constant is the shared primary-source fact, while the operator forms differ (`amount <= c` vs `¬ c < amount`) and the bridge is a kernel-checked ∀ theorem, not an assumption.

U（Uncertainty/out-of-scope）: kernel attestation is for this checkout/toolchain (Lean 4.35.0) only.

## Check 6 — 以下 inclusive, off-by-one at 1,000,000

H（Falsifiable hypothesis）: 以下 is inclusive: `withinPaymentCeiling 1_000_000 = true` and `withinPaymentCeiling 1_000_001 = false`.

T（Reproduction）: `ceiling_inclusive`, `first_above`, `zero_true` theorems; examples at `999_999 → true`, `1_000_000 → true`, `1_000_001 → false`; `agree_payment_ceiling` instantiated at 0, 1M, 1M+1; all discharged by `by decide`/`rfl` and compiled.

D（Decision）: **PASS**. Boundary is exact: 1,000,000 accepted, 1,000,001 rejected; no off-by-one.

C（Competing interpretation）: 未満 (strict `<`) would wrongly reject exactly 1,000,000; 超える (`>`) would invert the predicate. The clause says 以下, not 未満/超える, and the universal theorem excludes both readings.

U（Uncertainty/out-of-scope）: the legal effect of meeting this condition (what obligation it gates) is explicitly not modelled; human legal review pending.

## Check 7 — audit pin, imports, evidence integration

H（Falsifiable hypothesis）: the transcription_audit pin, the three JapanTaxLaw.lean imports and the norm id are correctly wired.

T（Reproduction）: `transcription_audit.py` lines 2050-2054 pin law `340M50000040011`, article `第八十七条`, needle verbatim; `JapanTaxLaw.lean` lines 783-785 import all three new modules; task_queue reconstruction emits the claimed norm id (Check 2); full build passed.

D（Decision）: **PASS**. Pin/imports/norm id all consistent with the source JSON.

C（Competing interpretation）: an initially empty `findstr` for the pin was a shell/encoding artifact — re-checked with ripgrep and the pin is present; no defect.

U（Uncertainty/out-of-scope）: the claimed norm id is not yet a key in `data/verification_evidence.json`; this is expected because evidence regeneration gates on this module-specific adversarial review existing (generator `review_ok` scans `docs/adversarial/*.md` for the `### IncomeRegPaymentCeiling1M.lean` heading with 独立再抽出 + 照合/判定 + H/T/D/C/U). Once this review lands and CI regenerates, the entry is produced. This is an integration/evidence matter, not a legal-correctness or Lean-kernel defect.

---

## Verdict

**No concrete defect found.** All seven empirical checks are PASS: byte-exact snapshot hash, whole-law-unique verbatim needle in Article 87(3)(2) main provision (not the same-numbered 附則 article), consistent title/revision/status/INVENTORY, 百万 = 1,000,000, non-circular independent spec with a universal kernel-checked agreement theorem, inclusive 以下 boundary at exactly 1,000,000, and correct pin/import/norm-id wiring. The whole library compiles. The only observations above are non-defect nuances (施行規則 English gloss; evidence-ledger integration timing).

This is **not a legal-correctness claim**. The model covers one computable CONDITION slice only; classification of 満期返戻金等, the gated reporting obligation, 同一人 identity and human legal interpretation remain **pending human legal review (LEGAL_REVIEW_PENDING)**.
