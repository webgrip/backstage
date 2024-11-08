import {
  TeamTransformer,
  defaultOrganizationTeamTransformer, // https://github.com/backstage/backstage/blob/master/plugins/catalog-backend-module-github/src/lib/defaultTransformers.ts
  UserTransformer,
  defaultUserTransformer,
} from '@backstage/plugin-catalog-backend-module-github';

export const myTeamTransformer: TeamTransformer = async (team, ctx) => {
  const backstageTeam = await defaultOrganizationTeamTransformer(team, ctx);

  if (backstageTeam) {
    backstageTeam.metadata.namespace = 'webgrip';
  }

  return backstageTeam;
};

export const myUserTransformer: UserTransformer = async (user, ctx) => {
  const backstageUser = await defaultUserTransformer(user, ctx);

  if (backstageUser) {
    backstageUser.metadata.namespace = 'webgrip';
    backstageUser.metadata.description = 'Loaded from GitHub Org Data';
  }

  return backstageUser;
};
