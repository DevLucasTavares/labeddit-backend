import z from 'zod'

export interface EditCommentInputDTO {
  content: string,
  token: string,
  idToEdit: string
}

export type EditCommentOutputDTO = undefined

export const EditCommentSchema = z.object({
  content: z.string().min(1),
  token: z.string().min(1),
  idToEdit: z.string().min(1)
})