# Adversarial review — 関税定率法 art. 7 読替え

Unit: `NORM|fc34952b4102c0a6697423e84c629c0eea802fb72c83594cac7374694c7ac66f`
Verbatim: 「この場合において、第七項本文中「一年以内に」とあるのは、
「一年以内において速やかに」と読み替えるものとする。」

- **H**: the rewrite might be applied to substrings (e.g. 「一年以内に、」) or
  to phrases other than the quoted one; or a string-based proof could smuggle
  in `Classical.choice` / `Quot.sound`.
- **T**: re-extract art. 7 and confirm both quoted phrases occur; run the
  Lean-independent auditor (phrase-only, D=PASS); check `#print axioms` on
  `applies_to_quoted`, `leaves_other`, `agree_spec_impl`; exhaustively check
  the three constructors of the declared `Phrase` domain.
- **D**: verbatim located; the auditor reports `phrase_only_correspondence=true`
  because this unit has no numeric literal — that is stated, not hidden. The
  first string-based model was **rejected** after `#print axioms` revealed
  `Classical.choice`/`Quot.sound`; the current finite-phrase model has only
  standard `propext`. `agree_spec_impl` is exhaustive over the declared
  domain, not a sampled grid. The rewrite changes only `original` and leaves
  `replacement` and `other` untouched.
- **C**: a wider rewrite over arbitrary text containing the phrase is a
  competing reading; this unit models whole-phrase substitution and records
  that limitation explicitly.
- **U**: the trigger 「この場合」 and the meaning of the one-year period are
  caller-established; human legal review remains pending.
