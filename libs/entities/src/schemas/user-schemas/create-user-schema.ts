import { ApiProperty } from '@nestjs/swagger';
import { z } from 'zod';

export class CreateUserSchema {
  @ApiProperty()
  public email!: string;

  @ApiProperty()
  public nik!: string;

  @ApiProperty()
  public fullname!: string;

  @ApiProperty({
    example: 'min length 6, upper case 1, numbers 1',
  })
  public password!: string;
}

export const CreateUserZodSchema = z.object({
  email: z
    .string()
    .email({
      message: 'Email tidak valid',
    })
    .nonempty({
      message: 'Email tidak boleh kosong',
    }),
  nik: z.string().nonempty({
    message: 'NIK tidak boleh kosong',
  }),
  fullname: z.string().nonempty({
    message: 'Nama lengkap tidak boleh kosong',
  }),
  password: z
    .string()
    .nonempty({
      message: 'Password tidak boleh kosong',
    })
    .regex(/^(?=.*[a-z])(?=.*[A-Z])(?=.*\d).*$/, {
      message:
        'Password harus memiliki setidaknya 6 karakter dan mengandung setidaknya 1 huruf kecil, 1 huruf besar, dan 1 angka. Tidak boleh mengandung simbol ',
    }),
});

export type TCreateUserSchema = z.infer<typeof CreateUserZodSchema>;