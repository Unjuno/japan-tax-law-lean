# Unit review — 相続税法 第十三条(2) 第二号 EFFECT

Normative unit id: `NORM|4db9b05db4964c68d07dea49463fe1dd72302abd50067a924db0ecd6d0e054fb`

Law: 325AC0000000073 (相続税法), Act. SHA-256 c01bb9be…5043a7.

Verbatim source text (injected from the queue, not hand-typed): 「その財産を目的とする留置権、特別の先取特権、質権又は抵当権で担保される債務」

Exact source position: `LawBody[3]/MainProvision/MainProvision[1]/Article:13/Article#13/Paragraph#2/Item#2/ItemSentence/Sentence#1` — Item 2 flat text is 「二」 + the needle.

Norm kind: **EFFECT** — an enumeration of security rights securing a debt: possessory lien (retention right) (留置権), a special preferential right (特別の先取特権), a pledge (質権) or a mortgage (抵当権). Computable slice: enumerated-set membership. All statutory terms below are reproduced from the verbatim needle; the canonical quote is byte-verbatim.

## Source correspondence (independent of Lean)
| field | value |
|---|---|
| H | The four enumerated rights (retention, special preferential right, pledge, mortgage) are listed; an unlisted right is not covered by this enumeration. |
| T | `scripts/ci/transcription_audit.py` article-kind check for InheritanceTaxArt13SecurityRightKinds.lean. |
| D | PASS — transcription audit 527/527. |
| C | Only enumeration membership is modeled. The substantive legal effect of these rights, the rest of Article 13, and legal correctness are out of scope. |
| U | Human legal review remains `LEGAL_REVIEW_PENDING`. |

## Model and proof scope
- Implementation: `JapanTaxLaw/InheritanceTaxArt13SecurityRightKinds.lean` — `SecurityRight` (retention/specialPriority/pledge/mortgage/other), `isListedRight` (true×4, false for other), five boundary theorems.
- Independent spec: `SpecListedRight` Prop disjunction, representationally distinct; `agree_retention`/`agree_other` axiom-free (rfl, left/right, rcases).
- Build: full lake build success (1741 jobs); all nine unit theorems axiom-free; no `sorryAx`/`Classical.choice`.

## Not modelled
Substantive legal effect of the rights, rest of Article 13, legal correctness — all NOT MODELLED.

## Dependencies (honest)
The queue records no dependencies for this unit; no cross-law constant introduced.

## Adversarial review
Independent findings recorded in `docs/ADVERSARIAL_INHERITANCE_TAX_ART13_SECURITY_RIGHT_KINDS.md`.
