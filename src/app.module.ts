import { Module } from '@nestjs/common';
import { AuthModule } from './auth/auth.module';
import { SupplierModule } from './supplier/supplier.module';
import { AdminModule } from './admin/admin.module';

@Module({
  imports: [AuthModule, SupplierModule, AdminModule],
})
export class AppModule {}
