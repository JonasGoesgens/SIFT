% Input:
% feature(FeatureNum)
% feature_pattern_pair(FeaturePatNum)
% constraint(Constraint)
% feature_sel :- feature_pattern_pair_sel rules
% constraint_fulfilled(Constraint) rules
{feature_sel(Feat) : feature(Feat)}.
{feature_pattern_pair_sel(FeatPat) : feature_pattern_pair(FeatPat)}.
:- constraint(Constr), not constraint_fulfilled(Constr).
#minimize{1@2, feature_sel(Feat) : feature_sel(Feat)}.
#minimize{1@1, feature_pattern_pair_sel(FeatPat) : feature_pattern_pair_sel(FeatPat)}.
#show feature_sel/1.
#show feature_pattern_pair_sel/1.
%suppress warnings for feature_pattern_pair not appearing in rule head
%as some instance only need feature facts.
#defined feature_pattern_pair/1.
