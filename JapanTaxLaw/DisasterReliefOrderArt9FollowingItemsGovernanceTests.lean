import JapanTaxLaw.DisasterReliefOrderArt9FollowingItemsGovernanceSpec

/-!
# DisasterReliefOrderArt9FollowingItemsGovernanceTests — kernel-checked checks

Verifies DELEGATION 「前二項の規定を適用する場合においては、次の各号の定めるところによる。」: following-items source selected, other not.
-/

namespace JapanTaxLaw.DisasterReliefOrderArt9FollowingItemsGovernance

example : governingSource = GoverningSource.followingItems := source_is_following_items
example : governingSource ≠ GoverningSource.other := other_not_selected
example : SpecGoverningSource governingSource := implementation_satisfies_spec
example : ¬ SpecGoverningSource GoverningSource.other := other_not_satisfying

end JapanTaxLaw.DisasterReliefOrderArt9FollowingItemsGovernance
