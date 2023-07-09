import { config } from '@keystone-next/keystone/schema';

export default config({
  db: {
    provider: 'mysql',
    url: 'mysql://root:@localhost:3306/keystone',
   
  },
  /* ... */
});