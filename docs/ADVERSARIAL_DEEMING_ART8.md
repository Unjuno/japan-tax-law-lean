# Adversarial review — 関税定率法 art. 8(3) みなし納付

Unit: `NORM|b3959ec60d94050465584c3e696d6cbdb3df0635bd90da1dfd2c238b7f7e4207`
Verbatim: 「この場合において、当該貨物につき第九項第一号の規定により課された
暫定的な関税が納付されているときは、当該不当廉売関税が納付されたものと
みなす。」

- **H**: the deeming could be modelled as bidirectional (paid ⇔ deemed paid),
  or applied when the provisional duty is unpaid; or amounts could be silently
  assumed.
- **T**: re-extract art. 8(3); confirm verbatim; inspect `deemPaid` (a one-way
  map from the caller-established Bool for provisional payment); exhaustively
  check both Bool values; check `#print axioms`; run the Lean-independent
  auditor (phrase-only since there is no numeric literal).
- **D**: verbatim located; `phrase_only_correspondence=true` is stated; both
  `deem_when_paid` and `no_deem_when_unpaid` are axiom-free, and agreement with
  the independent spec is axiom-free. The model is one-way, matching
  「納付されているときは…みなす」; the reverse direction is NOT asserted.
  Amounts, goods identity and the 第九項第一号 cross-reference are separate
  units and are not modelled.
- **C**: a reading that deems payment regardless of provisional payment is a
  competing interpretation; rejected by the verbatim conditional and recorded.
- **U**: the fact of provisional payment is caller-established; human legal
  review remains pending.
