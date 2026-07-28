import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BioinformaticsCanonicalLaneLean

structure Metabolite where
  name : String
  formula : String

structure Reaction where
  id : String
  reactants : List (Metabolite × Float)
  products : List (Metabolite × Float)
  reversible : Bool

structure MetabolicNetworkPackage where
  metabolites : List Metabolite
  reactions : List Reaction
  fluxBalanceSolution : Option (List Float)  -- flux values per reaction
  biomassReaction : String

structure MetabolicNetworkEvidence (M : MetabolicNetworkPackage) where
  metabolitesNonEmpty : M.metabolites ≠ []
  reactionsNonEmpty : M.reactions ≠ []
  biomassExists : ∃ r ∈ M.reactions, r.id = M.biomassReaction
  fluxBalanceDefined : M.fluxBalanceSolution ≠ none

structure MetabolicNetworkClosed (M : MetabolicNetworkPackage) : Prop :=
  metabolitesNonEmpty : M.metabolites ≠ []
  reactionsNonEmpty : M.reactions ≠ []
  biomassExists : ∃ r ∈ M.reactions, r.id = M.biomassReaction
  fluxBalanceDefined : M.fluxBalanceSolution ≠ none

theorem metabolic_network_closed_from_evidence (M : MetabolicNetworkPackage) (E : MetabolicNetworkEvidence M) : MetabolicNetworkClosed M :=
by
  exact ⟨E.metabolitesNonEmpty, E.reactionsNonEmpty, E.biomassExists, E.fluxBalanceDefined⟩

end BioinformaticsCanonicalLaneLean
end HautevilleHouse